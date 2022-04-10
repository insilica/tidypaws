#' create new user(s) and immediately add them to group(s)
#' every user is added to every group
#' @import dplyr
#' @import purrr
#' @param iam the iam object from paws
#' @param username vector of usernames
#' @param groupname vector of groupnames
#' @return list with creation results and group_add results 
#' @export
#' @examples
#' if(FALSE){ paws::ec2()$describe_instances() |> tidypaws() }
iam_create_user_and_add_to_group = function(iam=paws::iam(),username,groupname){
    stop("THIS IS AN UNTESTED FUNCTION AND YOU SHOULD REVIEW IT CAREFULLY BEFORE USING")
    safe_create = purrr::safely(iam$create_user)
    safe_add    = purrr::safely(iam$add_user_to_group)
    
    creation = map(username, safe_create)
    addition = expand.grid(username,groupname) |> 
        select(username = .data$Var1, groupname= .data$Var2) |>
        mutate(groupadd = map2(username,groupname, ~ safe_add(UserName = .x, GroupName = .y)))
    
    tibble::lst(creation,addition)
}

#' get the url of a key in an s3 bucket
#' @param bucket the s3 bucket to query
#' @param key the key you want
#' @export 
s3_get_key_url = function(bucket,key){
    glue::glue("http://{bucket}.s3.amazonaws.com/{key}")
}