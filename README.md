# tidypaws

```{r}
paws::s3()$list_buckets() |> tidypaws::tidypaws()
```

$Buckets
# A tibble: 35 × 2
   Name                 CreationDate       
   <chr>                <dttm>             
 1 joes_bucket          2022-03-20 01:08:17
 2 the_best_bucket      2017-04-11 14:15:07
 ...
# … with 25 more rows

$Owner
# A tibble: 2 × 1
  ...1                                                            
  <chr>                                                           
1 info                                                            
2 3827e5...