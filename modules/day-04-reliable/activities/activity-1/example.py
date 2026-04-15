def validate_box(box):
    if len(box) != 4:
        raise ValueError("box must contain x1, y1, x2, y2")
    if box[2] <= box[0] or box[3] <= box[1]:
        raise ValueError("box coordinates must satisfy x2 > x1 and y2 > y1")


def compute_iou(box_a, box_b):
    validate_box(box_a)
    validate_box(box_b)

    x_left = max(box_a[0], box_b[0])
    y_top = max(box_a[1], box_b[1])
    x_right = min(box_a[2], box_b[2])
    y_bottom = min(box_a[3], box_b[3])

    inter_width = max(0.0, x_right - x_left)
    inter_height = max(0.0, y_bottom - y_top)
    inter_area = inter_width * inter_height

    area_a = (box_a[2] - box_a[0]) * (box_a[3] - box_a[1])
    area_b = (box_b[2] - box_b[0]) * (box_b[3] - box_b[1])
    union_area = area_a + area_b - inter_area

    if union_area <= 0:
        raise ValueError("union area must be positive")

    return inter_area / union_area


def agreement_label(score):
    if score >= 0.7:
        return "strong"
    if score >= 0.3:
        return "mixed"
    return "weak"


def agreement_summary(name, box_a, box_b):
    score = compute_iou(box_a, box_b)
    return f"{name}: IoU = {score:.3f} ({agreement_label(score)})"


reference_box = [0.10, 0.10, 0.50, 0.50]
slightly_shifted_box = [0.20, 0.20, 0.60, 0.60]
touching_box = [0.50, 0.10, 0.80, 0.40]
separate_box = [0.70, 0.70, 0.90, 0.90]
invalid_box = [0.75, 0.20, 0.60, 0.40]


def run_checks():
    assert round(compute_iou(reference_box, slightly_shifted_box), 3) == 0.391
    assert compute_iou(reference_box, touching_box) == 0
    assert compute_iou(reference_box, separate_box) == 0
    assert agreement_label(0.7) == "strong"
    assert agreement_label(0.3) == "mixed"

    try:
        compute_iou(reference_box, invalid_box)
    except ValueError:
        pass
    else:
        raise AssertionError("Invalid box should raise ValueError")

    print(agreement_summary("normal overlap", reference_box, slightly_shifted_box))
    print("All checks passed")


if __name__ == "__main__":
    run_checks()
