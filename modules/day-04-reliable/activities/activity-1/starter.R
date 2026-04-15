compute_iou <- function(box_a, box_b) {
  x_left <- max(box_a[1], box_b[1])
  y_top <- max(box_a[2], box_b[2])
  x_right <- min(box_a[3], box_b[3])
  y_bottom <- min(box_a[4], box_b[4])

  inter_width <- x_right - x_left
  inter_height <- y_bottom - y_top
  inter_area <- inter_width * inter_height

  area_a <- (box_a[3] - box_a[1]) * (box_a[4] - box_a[2])
  area_b <- (box_b[3] - box_b[1]) * (box_b[4] - box_b[2])
  union_area <- area_a + area_b - inter_area

  inter_area / union_area
}

agreement_label <- function(score) {
  if (score > 0.7) {
    return("strong")
  }

  if (score > 0.3) {
    return("mixed")
  }

  "weak"
}

agreement_summary <- function(name, box_a, box_b) {
  score <- compute_iou(box_a, box_b)
  sprintf("%s: IoU = %.3f (%s)", name, score, agreement_label(score))
}

reference_box <- c(0.10, 0.10, 0.50, 0.50)
slightly_shifted_box <- c(0.20, 0.20, 0.60, 0.60)
touching_box <- c(0.50, 0.10, 0.80, 0.40)
separate_box <- c(0.70, 0.70, 0.90, 0.90)
invalid_box <- c(0.75, 0.20, 0.60, 0.40)

cat(agreement_summary("normal overlap", reference_box, slightly_shifted_box), "\n")
cat(agreement_summary("touching edge", reference_box, touching_box), "\n")
cat(agreement_summary("no overlap", reference_box, separate_box), "\n")
cat(agreement_summary("invalid box", reference_box, invalid_box), "\n")
