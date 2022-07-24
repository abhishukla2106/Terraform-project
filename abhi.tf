#By using Locals
	resource "local_file" "myfile" {
	     filename =local.abhi
	     content = local.content
	}
locals {
  abhi = "local.txt"
  content = "welcome to abhishek file"
}
#by using random generate random_id
resource "local_file" "myfile1" {
  filename  = local.abhi1
  content = "${random_id.content.hex}"
}

locals {
  abhi1 = "random_id.txt"
  mycontent = "hello my name is abhishek shukla "
  age=21
  phone=0000457898
}
resource "random_id" "content"{
    byte_length = 10
}


#By using number
resource "local_file" "myfile2" {
     filename = "number.txt"
     content = var.abhi2
}
variable "abhi2" {
    type = number
    description = "i am passing the written value in the content"
    default =12345678
}
# #By using string
resource "local_file" "myfile3" {
     filename = "String.txt"
     content = var.abhi3
}
variable "abhi3" {
    type = string
    description = "i am passing the written value in the content"
    default = "hey i am creating a string" 
}
# #By using list 
resource "local_file" "myfile4" {
     filename = "list.txt"
     content = var.abhi4[2]
}
variable "abhi4" {
    type = list(any)
    description = "i am passing the written values in the content"
    default = ["5547","2134",6897]
}
# #By using map
resource "local_file" "myfile5" {
     filename = "map.txt"
     content = var.abhi5["pass-content"]
}

  variable "abhi5" {
    type = map(any)
    description = "i am passing the written values in the content"
    default = {
      "key1"="Rahul"
      "key2"="Karan"
      "key3"="Rohan"
      "pass-content"="my content"  
}
  }
  #using object
resource "local_file" "myfile6" {
     filename = "object.txt"
     content = var.abhi6["content"]
}
variable "abhi6" {
    type = object({
    filename=string,
    content=number
  })
description = "i am pass the values of content written in the file"
default = {
  content = 1999
  filename = "hello sir"
}
 }
 # using terraform.tfvars
resource "local_file" "tfvars" {
  filename = var.abhi
  content = var.content
}

#output Block
resource "local_file" "myfile7" {
  filename = var.abhi
  content = var.content
}
output "output_name" {
  value = local_file.myfile7.content
}
variable "abhi" {
  type=string
  default="output.txt"
}
variable "content" {
  type = string
  default = "abhishek shukla"
}


