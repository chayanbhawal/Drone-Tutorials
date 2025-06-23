function [peak_time, overshoot_pct, settle_time] = compute_metrics(t, z, z_ref)
    [peak_val, peak_idx] = max(z);
    peak_time = t(peak_idx);
    overshoot_pct = max(0, (peak_val - z_ref)/z_ref * 100);

    band = 0.02 * z_ref;
    settled_idx = find(abs(z - z_ref) > band);

    if isempty(settled_idx)
        settle_time = 0;
    else
        last_out_idx = max(settled_idx);
        if last_out_idx < length(t)
            settle_time = NaN;
            for j = last_out_idx+1:length(t)
                if all(abs(z(j:end) - z_ref) < band)
                    settle_time = t(j);
                    break;
                end
            end
        else
            settle_time = NaN;
        end
    end
end
