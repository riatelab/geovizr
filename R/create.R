#' @title Create a geoviz map container
#' @description The \code{viz_create} function initializes a geovizr map by creating
#' an SVG container and defining its main configuration (projection, domain, size,
#' margins, and layout). It is the first step in any map construction workflow.
#' @param width numeric. Optional. It allows you to manually set the width of the map. (default size of the device). Note that if responsive = TRUE, the SVG always has the size defined by the width in map coordinates, which does not correspond to the actual displayed size of the map. Similarly, if resize = TRUE, the size of the map is updated every time the window is resized.
#' @param responsive logical. Optional. Whether the SVG map resizes with the container
#' Nothing is recalculated. It’s just the image that is enlarged or reduced.
#' (default TRUE).
#' @param resize logical. If TRUE, the widget automatically redraw when the container size changes. Everything is recalculated every time the window is resized (default FALSE)
#' @param id character. Optional. ID of the SVG container (default "map").
#' @param domain A spatial data object, such as an `sf` object or a `terra::SpatVector`. Optional. Geographic domain to display.
#' @param projection character. Optional. D3 Map projection (e.g. "mercator", "equalearth", "Polar", "Spilhaus",...).
#' @param background character. Optional. Background color.
#' @param fontFamily character. Optional. Font family applied to the entire map.
#' @param margin numeric or vector. Optional. Map margins (default 0). Can be a single value
#' or c(top, right, bottom, left).
#' @param zoomable logical or numeric or character. Optional. Enables zoom interaction.
#' Can define zoom extent or use "versor" for spherical zoom.
#' @param control logical or numeric vector. Optional. Adds zoom control panel and optionally
#' defines its position by using a vector of 2 values.
#' @param warning logical. Optional. Whether to display warnings on the map (default TRUE).
#' @return A list containing map parameters and an initially empty list of layers to be displayed.
#' @export
#' @examples
#' library(sf)
#' world <- st_read(
#'   system.file("gpkg/world.gpkg", package = "geovizr"),
#'   quiet = TRUE
#' )
#'
#' viz_create(projection = "EqualEarth", zoomable = TRUE) |>
#'   viz_path(data = world, fill = "#38896F") |>
#'   viz_render()
viz_create <- function(
  id = "map",
  width = NULL,
  resize = TRUE,
  domain = NULL,
  responsive = TRUE,
  projection = NULL,
  background = NULL,
  fontFamily = NULL,
  margin = c(0, 0, 0, 0),
  zoomable = NULL,
  control = TRUE,
  warning = TRUE
) {
  structure(
    list(
      params = list(
        id = id,
        width = width,
        resize = resize,
        domain = domain,
        responsive = responsive,
        projection = projection,
        background = background,
        fontFamily = fontFamily,
        margin = margin,
        zoomable = zoomable,
        control = control,
        warning = warning
      ),
      layers = list()
    ),
    class = "geoviz"
  )
}
