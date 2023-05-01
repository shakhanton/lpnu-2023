const AWS = require("aws-sdk");
const dynamodb = new AWS.DynamoDB({
  region: process.env.AWS_REGION,
  apiVersion: "2012-08-10"
});

exports.handler = (event, context, callback) => {
  const params = {
    TableName: process.env.TABLE_NAME
  };
  dynamodb.scan(params, (err, data) => {
    if (err) {
      console.log(err);
      callback(err);
    } else {
      const courses = data.Items.map(item => {
        return {
          id: item.id.S,
          title: item.title.S,
          watchHref: item.watchHref.S,
          authorId: item.authorId.S,
          length: item.length.S,
          category: item.category.S
        };
      });
      callback(null, courses);
    }
  });
};