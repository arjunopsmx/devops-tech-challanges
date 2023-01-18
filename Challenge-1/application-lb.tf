# Application LoadBalancer Creation

resource "aws_lb" "mywebapp-alb" {
  name               = "My Web Application LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mywebappsg.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}

resource "aws_lb_target_group" "mywebapp-alb-tg" {
  name     = "Mywebapp LB TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.mywebappvpc.id
}

resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.mywebapp-alb-tg.arn
  target_id        = aws_instance.mywebappinstance1.id
  port             = 80

  depends_on = [
    aws_instance.mywebappinstance1,
  ]
}

resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.mywebapp-alb-tg.arn
  target_id        = aws_instance.mywebappinstance2.id
  port             = 80

  depends_on = [
    aws_instance.mywebappinstance2,
  ]
}

resource "aws_lb_listener" "mywebapp-lb-listener" {
  load_balancer_arn = aws_lb.mywebapp-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mywebapp-alb-tg.arn
  }
}
