#' Append external screening data to a discoveryengine definition
#'
#' @param constituency A discoveryengine definition
#' @return data frame with the following columns: entity id, median_income, fec_matched_giving, hh_fec_matched_giving, ca_matched_giving, hh_ca_matched_giving, has_sec, is_director, is_officer, is_ten_percenter, hh_has_sec, hh_is_director, hh_is_officer, hh_is_ten_percenter, sec_link, hh_sec_links
#' @export
#' @examples
#' wealthy = has_capacity(1)
#' wealthy %>% screening %>% display
screening <- function(constituency) {
  res <- listbuilder::add_template(constituency, median_income_query_template)
  res <- listbuilder::add_template(res, fec_query_template,
                                   column_formats = list(fec_matched_giving = na_zero,
                                                         hh_fec_matched_giving = na_zero))
  res <- listbuilder::add_template(res, ca_query_template,
                                   column_formats = list(ca_matched_giving = na_zero,
                                                         hh_ca_matched_giving = na_zero))
  res <- listbuilder::add_template(res, sec_query_template,
                                   column_formats = list(
                                     has_sec = onezero_tf,
                                     is_director = onezero_tf,
                                     is_officer = onezero_tf,
                                     is_ten_percenter = onezero_tf
                                   ))
  res <- listbuilder::add_template(res, sec_hh_template,
                                   column_formats = list(
                                     hh_has_sec = onezero_tf,
                                     hh_is_director = onezero_tf,
                                     hh_is_officer = onezero_tf,
                                     hh_is_ten_percenter = onezero_tf
                                   ))
  res <- listbuilder::add_template(res, cik_link_template)
  listbuilder::add_template(res, hh_cik_link_template)
}
