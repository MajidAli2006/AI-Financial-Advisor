import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fin_talk/core/constants/app_strings.dart';
import 'package:fin_talk/core/design_system/design_tokens.dart';
import 'package:fin_talk/features/dashboard/providers/dashboard_providers.dart';

class SpendingChart extends ConsumerWidget {
  const SpendingChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final chartData = ref.watch(chartDataProvider);

    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: DesignTokens.spacingMD,
        vertical: DesignTokens.spacingSM,
      ),
      child: Padding(
        padding: EdgeInsets.all(DesignTokens.spacingLG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.spendingForecast,
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: DesignTokens.spacingLG),
            SizedBox(
              height: DesignTokens.chartHeight,
              child: LineChart(
                _buildChartData(context, chartData, colorScheme),
              ),
            ),
          ],
        ),
      ),
    );
  }

  LineChartData _buildChartData(
    BuildContext context,
    List<ChartDataPoint> chartData,
    ColorScheme colorScheme,
  ) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: DesignTokens.chartGridInterval,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: colorScheme.surfaceContainerHighest
                .withOpacity(DesignTokens.opacityDisabled),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: _buildTitlesData(context, chartData),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: colorScheme.surfaceContainerHighest
              .withOpacity(DesignTokens.opacityDisabled),
          width: 1,
        ),
      ),
      minX: 0,
      maxX: (chartData.length - 1).toDouble(),
      minY: 0,
      maxY: DesignTokens.chartMaxY,
      lineBarsData: _buildLineBarsData(chartData, colorScheme),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => colorScheme.surface,
          tooltipRoundedRadius: DesignTokens.radiusSM,
        ),
      ),
    );
  }

  FlTitlesData _buildTitlesData(
    BuildContext context,
    List<ChartDataPoint> chartData,
  ) {
    final theme = Theme.of(context);

    return FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: DesignTokens.chartTitleReservedSize,
          interval: 1,
          getTitlesWidget: (value, meta) {
            if (value.toInt() >= 0 && value.toInt() < chartData.length) {
              return Padding(
                padding: EdgeInsets.only(top: DesignTokens.spacingSM),
                child: Text(
                  chartData[value.toInt()].label,
                  style: theme.textTheme.bodySmall,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: DesignTokens.chartAxisReservedSize,
          getTitlesWidget: (value, meta) {
            return Text(
              '\$${value.toInt()}',
              style: theme.textTheme.bodySmall,
            );
          },
        ),
      ),
    );
  }

  List<LineChartBarData> _buildLineBarsData(
    List<ChartDataPoint> chartData,
    ColorScheme colorScheme,
  ) {
    return [
      LineChartBarData(
        spots: chartData
            .asMap()
            .entries
            .map((e) => FlSpot(e.key.toDouble(), e.value.actual))
            .toList(),
        isCurved: true,
        color: colorScheme.primary,
        barWidth: DesignTokens.chartLineWidth,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          color:
              colorScheme.primary.withOpacity(DesignTokens.opacityDisabled / 4),
        ),
      ),
      LineChartBarData(
        spots: chartData
            .asMap()
            .entries
            .map((e) => FlSpot(e.key.toDouble(), e.value.predicted))
            .toList(),
        isCurved: true,
        color: colorScheme.primary.withOpacity(DesignTokens.opacityMedium),
        barWidth: DesignTokens.chartDashedLineWidth,
        dashArray: DesignTokens.chartDashPattern,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
      ),
    ];
  }
}
