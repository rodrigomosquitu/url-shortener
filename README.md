# AWS URL Shortener

Business Case

Given an URL, the solution should return a shortened version of it.
When a user browses to a minified URL, it should redirect to the original URL.

--------------


## Architecture design

![](https://nord-cloud-penguin.s3.us-east-1.amazonaws.com/Architecture%20URL%20Shortener.png)

## Domain Model

![](https://nord-cloud-penguin.s3.amazonaws.com/Domain+Model+URL+Shortener.png)
## Terraform

AWS URL Shortener uses Terraform in order to build and manage cloud services. 

## Terraform initial config

Update following variable from file /terraform/variables.tf:

- region: Especify the region where your services will be provisioned

--------------
## Prerequisites

To run URL Shortener on AWS you will need:

- [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started) (1.2.0+) installed.
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed.
- [NPM](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) installed.

Now lets configure your AWS account and associated credentials that allow you to create resources, running the below command:

`aws configure`

When prompted, provide AWS access key id and secret access key and choose a default region and output format:

`AWS Access Key ID [****************2345]: ....`  
`AWS Secret Access Key [****************2345]: ...`  
`Default region name [us-east-1]: `  
`Default output format [json]: `  

On a Windows machine, create a shortcut that links to the `install.bat` batch file. Just go into properties for the shortcut and select advanced, then "run as administrator" and run the shortcut.

YOU´RE DONE! 

---

## Troubleshooting

You could face one or both following errors:

> Error: Error creating API Gateway Integration Response: BadRequestException: Invalid mapping expression specified: Validation Result: warnings : [], errors : [No method response exists for method.]

> Error: Error creating API Gateway Deployment: BadRequestException: No integration defined for method

Thats because there are some dependencies associated to the order for provisioning the Terraform resources related to API Gateway and I did not have enough time to fix. Buuuuuut, you can run 'terraform apply' again and issues probably might be gone ! So run apply again and be happy !

`$ terraform apply`

Wait for some minutes for testing the application.

[Link explaining](https://stackoverflow.com/questions/42760387/terraform-aws-api-gateway-dependency-conundrum) "Error creating API Gateway Deployment: BadRequestException: No integration defined for method"


---

## Testing application

After resources had been provisioned, you need to log into your AWS account and get the "Distribution domain name" for the distribution created on CloudFront.

It looks like this:
xxxxxxxxxx.cloudfront.net

Replace the <CLOUD_FRONT_DOMAIN> below and curl the "create" REST service in order to create a campaign:

`curl -XPOST -H "Content-Type: application/json" https://<CLOUD_FRONT_DOMAIN>/create -d "{\"long_url\": \"https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/dynamodb-example-table-read-write.html\"}"`

The response is like this:

{
   "short_url":"xxxxxxxx.cloudfront.net/t/bForPBSLGb",
   "long_url":"https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/dynamodb-example-table-read-write.html"
}

Paste the "short_url" into the browser and SURPRISE!

---

## Architecture decisions

### AWS

AWS offers technologies for running code, managing data, and integrating applications, all without managing servers. AWS gets serverless technologies feature automatic scaling, built-in high availability, and a pay-for-use billing model to increase agility and optimize costs. 

### Terraform

Terraform gives developers and systems administrators an easy way to create a collection of related AWS resources and provision them in an orderly and predictable fashion.

### CloudFront

CloudFront speeds up the distribution of your content by routing each user request through the AWS backbone network to the edge location that can best serve your content.

### API Gateway

Offers simpler code (for your services and for your clients) and lower cumulative latencies. Improved security, since requests are managed with a single, consistent approach. Reduced load on valuable microservices.

### Lambda

Serverless, event-driven compute service that lets you run code for virtually any type of application or backend service without provisioning or managing servers and only pay for what you use, improving application resiliency.

#### Additional services used

+ AWS
    * Cloud 9
	* CloudFront
	* DynamoDB
	* API Gateway
	* Lambda
	* IAM
	* S3
    * AWS Cost Explorer
	
+ IaC
    * [Terraformer](https://github.com/GoogleCloudPlatform/terraformer) - A CLI tool that generates tf/json and tfstate files based on existing infrastructure (reverse Terraform).
    * Terraform

+ Architecture design
    * Drawio

## Links

[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rodrigo-oliveira-assis/)