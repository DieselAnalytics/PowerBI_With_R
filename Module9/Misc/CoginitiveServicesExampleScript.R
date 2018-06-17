# https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment
# Content-Type (optional): Media type of the body sent to the API.
# Ocp-Apim-Subscription-Key: Subscription key which provides access to this API.

# Request Body
{
	"documents":[{
		"language":"string",
	  "id":"string",
	  "text":"string"
	}
    ]
}

# Below is the Request body for the API having text id 1 = Negative sentiments, id 2 = Positive sentiments

request_body <- data.frame(
language = c("en", "en"),
id = c("1", "2"),
text = c("This is wasted! I'm angry", "This is awesome! Good Job Team! appreciated")
)

# Converting the Request body(Dataframe) to Request body(JSON)

request_body_json <- toJSON(list(documents = request_body), auto_unbox = TRUE)

# Below we are calling API (Adding Request headers using add_headers)

result <- POST("https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment",
body = request_body_json,
add_headers(.headers = c("Content-Type" = "application/json", "Ocp-Apim-Subscription-Key" = "my_subscrition_key")))
Output <- content(result)

# Show Output
Output


######################################################################################
######################################################################################
library(jsonlite)
library(httr)

# Creating the request body for Text Analytics API
trump_tweets_df["language"] = "en"
trump_tweets_df["id"] = seq.int(nrow(trump_tweets_df))
request_body_trump = trump_tweets_df[c(2, 3, 1)]

# Converting tweets dataframe into JSON
request_body_json_trump = toJSON(list(documents = request_body_trump))

# Calling text analytics API
result_trump = POST("https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment",
body = request_body_json_trump,
add_headers(.headers = c("Content-Type" = "application/json", "Ocp-Apim-Subscription-Key" = "my_Subscription-Key")))

Output = content(result_trump)

score_output_trump = data.frame(matrix(unlist(Output), nrow = 100, byrow = T))
score_output_trump$X1 = as.numeric(as.character(score_output_trump$X1))
score_output_trump$X1 = as.numeric(as.character(score_output_trump$X1)) * 10
score_output_trump["Candidate"] = "Trump"






j <- '{
    "documents": [
        {
            "score": 0.9999237060546875,
            "id": "1"
        },
        {
            "score": 0.0000540316104888916,
            "id": "2"
        },
        {
            "score": 0.99990355968475342,
            "id": "3"
        },
        {
            "score": 0.980544924736023,
            "id": "4"
        },
        {
            "score": 0.99996328353881836,
            "id": "5"
        }
    ],
    "errors": []
}'

x <- fromJSON(j)