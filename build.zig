const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardOptimizeOption(.{});

    const module = b.addModule("catch22", .{
        .target = target,
        .optimize = mode,
        .link_libc = true,
    });

    module.addCSourceFiles(.{
        .files = &.{
            "src/butterworth.c",
            "src/CO_AutoCorr.c",
            "src/DN_HistogramMode_10.c",
            "src/DN_HistogramMode_5.c",
            "src/DN_Mean.c",
            "src/DN_OutlierInclude.c",
            "src/DN_Spread_Std.c",
            "src/FC_LocalSimple.c",
            "src/fft.c",
            "src/helper_functions.c",
            "src/histcounts.c",
            "src/IN_AutoMutualInfoStats.c",
            "src/main.c",
            "src/MD_hrv.c",
            "src/PD_PeriodicityWang.c",
            "src/SB_BinaryStats.c",
            "src/SB_CoarseGrain.c",
            "src/SB_MotifThree.c",
            "src/SB_TransitionMatrix.c",
            "src/SC_FluctAnal.c",
            "src/splinefit.c",
            "src/SP_Summaries.c",
            "src/stats.c",
        },
    });

    const exe = b.addExecutable(.{
        .name = "catch22",
        .root_module = module,
    });

    b.installArtifact(exe);
}
