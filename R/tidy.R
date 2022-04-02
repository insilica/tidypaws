#' transform paws results to a tidyr format.
#' @param pawsresult result of all paws function 
#' @param compact whether to remove empty tables
#' @return a list of tibbles
#' @export
#' @examples
#' if(FALSE){ paws::ec2()$describe_instances() |> tidypaws() }
tidypaws <- function(pawsresult,compact=T) {
    res = pawsresult |>
        purrr::map(~ tidyr::tibble(name = .) |> tidyr::unnest_wider(name)) |>
        purrr::set_names(names(pawsresult))
    
    if(compact){ purrr::compact(res) }else{ res }
}