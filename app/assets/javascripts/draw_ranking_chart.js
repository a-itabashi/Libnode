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
        data: data,
        backgroundColor: [
          'rgb(255, 99, 132)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
        ],
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
