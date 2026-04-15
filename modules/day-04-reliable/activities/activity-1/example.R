validate_box <- function(box) {
  if (length(box) != 4) {
    stop("box must contain x1, y1, x2, y2")
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

agreement_label <- function(score) {
  if (score >= 0.7) {
    return("strong")
  }

  if (score >= 0.3) {
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

run_checks <- function() {
  stopifnot(round(compute_iou(reference_box, slightly_shifted_box), 3) == 0.391)
  stopifnot(compute_iou(reference_box, touching_box) == 0)
  stopifnot(compute_iou(reference_box, separate_box) == 0)
  stopifnot(agreement_label(0.7) == "strong")
  stopifnot(agreement_label(0.3) == "mixed")
  invalid_box_failed <- FALSE

  tryCatch(
    {
      compute_iou(reference_box, invalid_box)
    },
    error = function(e) {
      invalid_box_failed <<- TRUE
    }
  )

  stopifnot(invalid_box_failed)
  cat(agreement_summary("normal overlap", reference_box, slightly_shifted_box), "\n")
  cat("All checks passed\n")
}

run_checks()
