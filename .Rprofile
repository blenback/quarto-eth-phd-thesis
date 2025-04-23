# Use the R-profile to sert up packages and call helper functions when rendering
# all QMDs.

#load packages
packs<-c("ggplot2", "knitr", "kableExtra", "ggthemes", "stringr")

# Load required packages
invisible(lapply(packs, require, character.only = TRUE))

#stop kableExtra automatically setting the output format of all kable objects to 'html' which means that markdown syntax is not rendered correctly
options(kableExtra.auto_format = FALSE)

## Functions #####

#' thesis_tbl
#' 
#' custom function to apply kableExtra styling to all tables
#' 
#' @param x dataframe
thesis_tbl <- function(x, escape, ltable = FALSE) {
  x %>%
    kbl(digits = 3,
        align = "c",
        booktabs = T,
        format = "latex",
        longtable = ltable,
        escape = escape) %>%
    kable_styling(full_width = FALSE,
                  font_size = 10,
                  # latex_options = c("hold_position")
                  )%>%
    column_spec(1:ncol(x),
                latex_valign = "t") %>%
    row_spec(0, bold=TRUE) %>%
    asis_output()
}

#' theme_publication
#' 
#' custom ggplot2 theme to apply to all plots
#' 
#' @param base_size numeric base font size
#' @param base_family character base font family
#' @return ggplot2 theme
#' @export

theme_thesis <- function(
    base_size=14,
    base_family="Fira Sans"
) {
  (theme_foundation(
    base_size=base_size,
    base_family=base_family)+
     theme(
       plot.title = element_text(face = "bold",size = rel(1.2),hjust = 0.5),
       text = element_text(),
       panel.background = element_rect(colour = NA),
       plot.background = element_rect(colour = NA),
       panel.border = element_rect(colour = NA),
       axis.title = element_text(face = "bold",size = rel(0.8)),
       axis.title.y = element_text(angle=90,vjust =2),
       axis.title.x = element_text(vjust = -0.2),
       axis.text = element_text(), 
       axis.line = element_line(colour="black"),
       axis.ticks = element_line(),
       panel.grid.major = element_blank(),
       panel.grid.minor = element_blank(),
       legend.key = element_rect(colour = NA),
       legend.position = "bottom",
       legend.direction = "horizontal",
       legend.key.size= unit(0.2, "cm"),
       legend.title = element_text(face = "bold",
                                   hjust=0.5),
       plot.margin=unit(c(10,5,5,5),"mm"),
       strip.background=element_rect(colour="#f0f0f0",fill="#f0f0f0"),
       strip.text = element_text(face="bold")
     )
  )
}

#' thesis_color
#' 
#' Custom colour palette to be used in document
#' 
#' 
thesis_color <- function(...) {
  
  thesis_colors <- c(
  'Seafoam' = "#86B4A4", 
  'Beigetan' =	"#AC9E7C",
  'Lightgreen' =	"#8D9973",
  'Olivegreen' =	"#4F5838",
  'Forestgreen' =	"#2D4631",
  'Emeraldgreen' =	"#20342B",
  'Bluegreen' =	"#1C2D27",
  'Brown' =	"#413328",
  'Redbrown' =	"#4E3028",
  'Rust' =	"#8A341F",
  'Terracotta' =	"#A96524",
  'Orange' =	"#C06F2E",
  'Beige' =	"#D0A26E",
  'Paleorange' =	"#D69D68",
  'Bone' =	"#F6E3C2",
  'Tan' =	"#BDA776",
  'Mustard' =	"#B77D2B",
  'Ochre' =	"#9A792E"
  )
  
  cols <- c(...)
  
  if (is.null(cols))
    return (thesis_colors)
  
  thesis_colors[cols]
}

gen_discrete_ramp <- function(n, org_colour){
  
  # vector name of color
  col_name <- names(org_colour)

  # create empty vector to store colours
  cols <- c()
  
  # loop over n-clusters (i..e number of required colours)
  for(i in 1:n){
    
    # if i is 1 then the first colour is the scenario colour
    if(i == 1){
      cols[i] <- c(org_colour)
    } else {
      #use the preceding colour to generate a lighter variant
      cols[i] <- colorspace::lighten(cols[i-1], amount = 0.2)
    }
  }
  
  names(cols) <- sapply(1:n, function(x) paste0(col_name, x))
  return(cols)
}

# apply function to generate discrete colour ramps for all colours in thesis_color
discrete_ramps <- lapply(names(thesis_color()), function(x){
  
  # generate the discrete colour variants
  ramp <- gen_discrete_ramp(n = 5, org_colour = thesis_color(x))

})
names(discrete_ramps) <- paste0(names(thesis_color()), "_ramp")


#' thesis_palette
#' 
#' Function to combined defined colours into palettes
#' 
#' @param palette character: palette name

thesis_palette <- function(palette = "main", ...) {
  
  thesis_palettes <- c(
    discrete_ramps, 
    list(
      All = thesis_color(),
      'test_pal' = c("CAR" = unname(discrete_ramps[['Olivegreen_ramp']][3]),
                 "FF" = unname(discrete_ramps[['Ochre_ramp']][3]),
                 "HAB" = unname(discrete_ramps[['Lightgreen_ramp']][3]),
                 "ID" = unname(discrete_ramps[['Emeraldgreen_ramp']][3]),
                 "NDR" = unname(discrete_ramps[['Brown_ramp']][3]),
                 "PC" = unname(discrete_ramps[['Rust_ramp']][3]),
                 "POL" = unname(discrete_ramps[['Orange_ramp']][3]),
                 "REC" = unname(discrete_ramps[['Bone_ramp']][3]),
                 "SDR" = unname(discrete_ramps[['Terracotta_ramp']][3]),
                 "WY" = unname(discrete_ramps[['Seafoam_ramp']][3]))
    )
  )
  
    thesis_palettes[[palette]]
}

# To view your colour palette
# scales::show_col(thesis_palette("Scenarios"), cex_label = 2)

#' palette_gen
#' 
#' Helper function to create discrete colour scales
#' 
#' @param palette Character: name of the palette from thesis_palette()
#' @param direction Numeric to indicate direction of the scale

palette_gen <- function(palette = "main", direction = 1) {
  
  function(n) {
    
    if (n > length(thesis_palette(palette)))
      warning("Not enough colors in this palette!")
    
    else {
      
      all_colors <- thesis_palette(palette)
      
      all_colors <- unname(unlist(all_colors))
      
      all_colors <- if (direction >= 0) all_colors else rev(all_colors)
      
      color_list <- all_colors[1:n]
      
    }
  }
}

#' palette_gen_c
#' 
#' Helper function to create continuous colour scales
#' 
#' @param palette Character: name of the palette from thesis_palette()
#' @param direction Numeric to indicate direction of the scale

palette_gen_c <- function(palette = "main", direction = 1, ...) {
  
  pal <- thesis_palette(palette)
  
  pal <- if (direction >= 0) pal else rev(pal)
  
  colorRampPalette(pal, ...)
  
}


#' scale_fill_thesis
#' 
#' ggplot2 wrapper function to apply a fill argument using discrete scale produced using palette_gen()
#' 
#' @param palette Character: name of the palette from thesis_palette()
#' @param direction Numeric to indicate direction of the scale

scale_fill_thesis <- function(palette = "main", direction = 1, ...) {
  
  ggplot2::discrete_scale(
    "fill", "thesis",
    palette_gen(palette, direction),
    ...
  )
}

#' scale_colour_thesis
#' 
#' ggplot2 wrapper function to apply a colour argument using discrete scale produced using palette_gen()
#' 
#' @param palette Character: name of the palette from thesis_palette()
#' @param direction Numeric to indicate direction of the scale

scale_colour_thesis <- function(palette = "main", direction = 1, ...) {
  
  ggplot2::discrete_scale(
    "colour", "thesis",
    palette_gen(palette, direction),
    ...
  )
}

# replicate function using both spellings of colour (conventional approach)
scale_color_thesis <- scale_colour_thesis


#' scale_colour_thesis_c
#' 
#' ggplot2 wrapper function to apply a colour argument using continuous scale produced using palette_gen()
#' 
#' @param palette Character: name of the palette from thesis_palette()
#' @param direction Numeric to indicate direction of the scale

scale_colour_thesis_c <- function(palette = "main", direction = 1, ...) {
  
  pal <- palette_gen_c(palette = palette, direction = direction)
  
  scale_color_gradientn(colors = pal(256), ...)
  
}

# replicate function using both spellings of colour (conventional approach)
scale_color_thesis_c <- scale_colour_thesis_c

