context("validate_ractive")

test_that("ractive is valid", {
    set_root_path(system.file("examples", package="clickme"))
    ractive <- "force_directed"
    opts <- get_opts(ractive, data_file_name = "data")

    opts$path$template <- "fake_template_path"
    expect_error(validate_ractive(opts), "template directory not found in:")
    opts <- get_opts(ractive, data_file_name = "data")

    opts$path$template_file <- "fake_template_file"
    expect_error(validate_ractive(opts), "template.Rmd not found in:")
    opts <- get_opts(ractive, data_file_name = "data")

    opts$path$template_config_file <- "fake_template_config_file"
    expect_error(validate_ractive(opts), "config.yml not found in:")
    opts <- get_opts(ractive, data_file_name = "data")

    opts$path$translator_file <- "fake_translator_file"
    expect_error(validate_ractive(opts), "translator.R not found in:")
    opts <- get_opts(ractive, data_file_name = "data")

    opts$template_config$valid_names <- NULL
    expect_error(validate_ractive(opts), "doesn't contain a valid_names option")
    opts <- get_opts(ractive, data_file_name = "data")

    opts$template_config$scripts <- "fake_script_file"
    expect_error(validate_ractive(opts), "fake_script_file not found in:")
    opts <- get_opts(ractive, data_file_name = "data")

    opts$template_config$styles <- "fake_style_file"
    expect_error(validate_ractive(opts), "fake_style_file not found in:")
    opts <- get_opts(ractive, data_file_name = "data")

    opts$template_config$require <- "fake_library"
    expect_error(validate_ractive(opts), "fake_library is not installed")
    opts <- get_opts(ractive, data_file_name = "data")

})