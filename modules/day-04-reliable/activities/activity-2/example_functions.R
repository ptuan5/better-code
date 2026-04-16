# Example functions from Day 4 Activity 1

validate_box <- function(box) {
  if (length(box) != 4) {
    stop("box must contain x1, y1, x2, y2")
  }

  if (any(is.na(box))) {
    stop("box cannot contain missing coordinates")
  }

  if (box[3] <= box[1] || box[4] <= box[2]) {
    stop("box coordinates must satisfy x2 > x1 and y2 > y1")
  }
}

compute_iou <- function(box_a, box_b) {
  validate_box(box_a)
  validate_box(box_b)

  x_left <- max(box_a[1], box_b[1])
  y_top <- max(box_a[2], box_b[2])
  x_right <- min(box_a[3], box_b[3])
  y_bottom <- min(box_a[4], box_b[4])

  inter_width <- max(0, x_right - x_left)
  inter_height <- max(0, y_bottom - y_top)
  inter_area <- inter_width * inter_height

  area_a <- (box_a[3] - box_a[1]) * (box_a[4] - box_a[2])
  area_b <- (box_b[3] - box_b[1]) * (box_b[4] - box_b[2])
  union_area <- area_a + area_b - inter_area

  if (union_area <= 0) {
    stop("union area must be positive")
  }

  inter_area / union_area
}

compute_iou_safe <- function(box_a, box_b) {
  tryCatch(
    compute_iou(box_a, box_b),
    error = function(e) NA_real_
  )
}

add_iou_all_frames <- function(box_pairs) {
  for (row in seq_len(nrow(box_pairs))) {
    box_a <- c(
      box_pairs[row, "box_a_x1"],
      box_pairs[row, "box_a_y1"],
      box_pairs[row, "box_a_x2"],
      box_pairs[row, "box_a_y2"]
    )
    box_b <- c(
      box_pairs[row, "box_b_x1"],
      box_pairs[row, "box_b_y1"],
      box_pairs[row, "box_b_x2"],
      box_pairs[row, "box_b_y2"]
    )

    box_pairs[row, "iou"] <- compute_iou_safe(box_a, box_b)
  }

  box_pairs
}

build_agreement_curve <- function(box_pairs) {
  thresholds <- seq(0, 1, by = 0.05)
  data.frame(
    iou_threshold = thresholds,
    percent_agreement = sapply(
      thresholds,
      function(threshold) {
        100 * mean(ifelse(is.na(box_pairs$iou), FALSE, box_pairs$iou >= threshold))
      }
    )
  )
}
