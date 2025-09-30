const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardOptimizeOption(.{});

    const module = b.addModule("catch22", .{
        .target = target,
        .optimize = mode,
        .link_libc = true,
    });

    const cflags = &.{"-std=c11"};
    module.addCSourceFile(.{ .file = b.path("src/butterworth.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/CO_AutoCorr.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/DN_HistogramMode_10.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/DN_HistogramMode_5.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/DN_Mean.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/DN_OutlierInclude.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/DN_Spread_Std.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/FC_LocalSimple.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/fft.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/helper_functions.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/histcounts.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/IN_AutoMutualInfoStats.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/main.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/MD_hrv.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/PD_PeriodicityWang.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/SB_BinaryStats.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/SB_CoarseGrain.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/SB_MotifThree.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/SB_TransitionMatrix.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/SC_FluctAnal.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/splinefit.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/SP_Summaries.c"), .flags = cflags });
    module.addCSourceFile(.{ .file = b.path("src/stats.c"), .flags = cflags });

    const exe = b.addExecutable(.{
        .name = "catch22",
        .root_module = module,
    });

    b.installArtifact(exe);
}
