# %%
import matplotlib.pyplot as plt
import pandas as pd

# %%
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

    iou = inter_area / union_area
    return iou

# %%
def add_iou_all_frames(box_pairs):
    box_pairs = box_pairs.copy()

    for idx, row in box_pairs.iterrows():
        box_a = [row["box_a_x1"], row["box_a_y1"], row["box_a_x2"], row["box_a_y2"]]
        box_b = [row["box_b_x1"], row["box_b_y1"], row["box_b_x2"], row["box_b_y2"]]

        box_pairs.loc[idx, "iou"] = compute_iou(box_a, box_b)

    return box_pairs

# %%
def build_agreement_curve(box_pairs):
    thresholds = [value / 100 for value in range(0, 101, 5)]
    agreement_curve = pd.DataFrame(
        {
            "iou_threshold": thresholds,
            "percent_agreement": [
                (box_pairs["iou"].dropna() >= threshold).mean() * 100 for threshold in thresholds
            ],
        }
    )
    return agreement_curve

# %%
box_pairs = pd.read_csv("mock_box_pairs.csv")
box_pairs_w_iou = add_iou_all_frames(box_pairs)
curve_info = build_agreement_curve(box_pairs_w_iou)

plt.figure(figsize=(8, 5))
plt.plot(curve_info["iou_threshold"], curve_info["percent_agreement"])
plt.scatter(curve_info["iou_threshold"], curve_info["percent_agreement"])
plt.xlabel("IoU Threshold")
plt.ylabel("% Agreement")
plt.show()
