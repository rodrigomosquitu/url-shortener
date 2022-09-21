const AWS = require('aws-sdk');

const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {

    console.log("SHORT ID: \n" + event.short_id)

    let body;
    let statusCode = '200';
    const headers = {
        'Content-Type': 'application/json',
    };

    try {

        var params = {
            TableName: 'url-campaign-222',
            Key: {
                short_id: event.short_id
            }
        };

        body = await dynamo.get(params).promise();
        console.log("----- body: \n" + JSON.stringify(body))

    } catch (err) {
        statusCode = '400';
        body = err.message;
    } 
    
    return {
        "statusCode": 301,
        "location": body.Item.long_url
    }
}

