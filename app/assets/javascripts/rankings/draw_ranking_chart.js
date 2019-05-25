$(function () {
  draw_ranking_chart("upvote-count-chart", gon.top_5_upvotes_count)
  draw_ranking_chart("borrowed-count-chart", gon.top_5_borrowed_count)
})

function draw_ranking_chart(target, data) {
  let ctx = document.getElementById(target).getContext('2d');
  let myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      datasets: [{
        data: data
      }],
      labels: ['1位', '2位', '3位', '4位', '5位']
    },
    options: {
      legend: {
        display: false,
      },
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: true,
            },
          },
        ],
      },
      categoryPercentage: 0.1
    }
  });
};
