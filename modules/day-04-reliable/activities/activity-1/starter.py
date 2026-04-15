def compute_iou(box_a, box_b):
    x_left = max(box_a[0], box_b[0])
    y_top = max(box_a[1], box_b[1])
    x_right = min(box_a[2], box_b[2])
    y_bottom = min(box_a[3], box_b[3])

    inter_width = x_right - x_left
    inter_height = y_bottom - y_top
    inter_area = inter_width * inter_height

    area_a = (box_a[2] - box_a[0]) * (box_a[3] - box_a[1])
    area_b = (box_b[2] - box_b[0]) * (box_b[3] - box_b[1])
    union_area = area_a + area_b - inter_area

    return inter_area / union_area


def agreement_label(score):
    if score > 0.7:
        return "strong"
    if score > 0.3:
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

print(agreement_summary("normal overlap", reference_box, slightly_shifted_box))
print(agreement_summary("touching edge", reference_box, touching_box))
print(agreement_summary("no overlap", reference_box, separate_box))
print(agreement_summary("invalid box", reference_box, invalid_box))
