#include "ros/ros.h"

#include "laser_scanner_infoscreen/external_control.h"

#include <iostream>
#include <string.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <unistd.h>
#include <netdb.h>

#define CHAR_BUFFER_SIZE 512 // Size of message buffer, message itself is small
#define SERVER_ADDRESS localhost // Only local run now

using namespace std;

int client = -1;
int server = -1;

void tcp_message_callback(const laser_scanner_infoscreen::external_control::ConstPtr& msg)
{
  char char_buf[CHAR_BUFFER_SIZE] = {0};
  std::string temp;
  temp.append("zoom: ");
  temp.append(to_string(msg->zoom_level));
  temp.append(" area: ");
  temp.append(to_string(msg->area_active));
  temp.append(" gesture ");
  temp.append(to_string(msg->gesture));
  strcpy(char_buf, temp.c_str());
  send(server, char_buf, CHAR_BUFFER_SIZE, 0);
}

int main(int argc, char **argv)
{
  int tcp_port = 2259; // https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml
  struct sockaddr_in server_address;
  struct hostent *he;
  socklen_t address_size;
  
  // Establishing connection
  client = socket(AF_INET, SOCK_STREAM, 0);
  if (client < 0) {
    ROS_ERROR("Unable to create socket.");
    exit(1);
  }
  ROS_DEBUG("Socket creation complete.");
  const char hostname[] = "localhost";

  /* resolve hostname */
  if ( (he = gethostbyname(hostname) ) == NULL ) {
      exit(1); /* error */
  }

  /* copy the network address to sockaddr_in structure */
  memcpy(&server_address.sin_addr, he->h_addr_list[0], he->h_length);
  server_address.sin_family = AF_INET;
  server_address.sin_port = htons(tcp_port);
  
  if ((bind(client, (struct sockaddr*)&server_address,sizeof(server_address))) < 0) 
  {
      perror("bind failed. Error");
      return -1;
  }
  listen(client, 1);

  address_size = sizeof(server_address);
  server = accept(client,(struct sockaddr *)&server_address,&address_size);
  
  if (server < 0) 
  {
      perror("accept failed. Error");
      return -1;
  }
  ros::init(argc, argv, "track_objects_client");
	ros::NodeHandle n;
  
  ros::Subscriber sub = n.subscribe("external_control", 1000, tcp_message_callback);
  
  while (ros::ok() && server > 0) 
  {
      ROS_INFO("Connection established");
      ros::spinOnce();
  }
  close(server);
  ROS_INFO_STREAM("Connection terminated with IP " << inet_ntoa(server_address.sin_addr));
  close(client);
  
  return 0;
}