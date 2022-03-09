class GameOfLife
  def get_next_grid(current_grid)
    new_grid = current_grid

    new_grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|

        living_neighbours_count = number_of_living_neighbours(row_index, column_index, new_grid)

        new_state_of_cell(cell, living_neighbours_count)
      end
    end
  end

  def new_state_of_cell(cell, living_neighbours_count)
    cell
  end

  def number_of_living_neighbours(cell_row, cell_column, grid)
    0

  end

  def get_my_neighbours(cell_row, cell_column, grid)
    
    neighbours = []
    for i in cell_row -1..cell_row +1 do
      for j in cell_column -1..cell_column +1 do
      unless i == cell_row && j == cell_column
        neighbours << grid[i][j]
      end
      end
    end
    return neighbours
  end

  def number_of_live_cells(neighbours)
    neighbours.count(:live)
  end

end


# Any live cell with fewer than two live neighbours dies, as if by underpopulation.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overpopulation.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.