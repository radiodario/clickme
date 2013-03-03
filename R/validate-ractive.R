
validate_ractive <- function(opts) {

    if (!file.exists(opts$path$template)) stop(opts$name$template, " directory not found in: ", opts$path$ractive)

    if (!file.exists(opts$path$template_file)) stop(opts$name$template_file, " not found in: ", opts$path$template)

    if (!file.exists(opts$path$translator_file)) stop(opts$name$translator_file, " not found in: ", opts$path$template)

    if (!file.exists(opts$path$template_config_file)) stop(opts$name$template_config_file, " not found in: ", opts$path$template)

    if (is.null(opts$template_config$valid_names)) stop(opts$path$template_config_file, " doesn't contain a valid_names option")
    if (!is.null(opts$template_config$scripts)){
        sapply(opts$template_config$scripts, function(script_file_name){
            if (!file.exists(file.path(opts$path$external, script_file_name))) stop(script_file_name, " not found in: ", opts$path$external)
        })
    }

    if (!is.null(opts$template_config$styles)){
        sapply(opts$template_config$styles, function(style_file_name){
            if (!file.exists(file.path(opts$path$external, style_file_name))) stop(style_file_name, " not found in: ", opts$path$external)
        })
    }

    if (!is.null(opts$template_config$require)){
        sapply(opts$template_config$require, function(package_name){
            if (!is.installed(package_name)) stop(package_name, " is not installed, try install.packages(\"", package_name,"\")")
        })
    }

}