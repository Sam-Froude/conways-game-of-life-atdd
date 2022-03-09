describe GameOfLife do
  context '#new_state_of_cell' do
    context 'when cell is dead' do
      it 'stays dead if its neighbours are all dead' do
        initial_state = :dead
        living_neighbours_count = 0

        new_state = subject.new_state_of_cell(initial_state, living_neighbours_count)

        expect(new_state).to eq(:dead)
      end
    end
  end

  context '#number_of_living_neighbours' do
    it 'returns 0 given the middle cell in a dead grid' do
      target_cell = :dead

      dead_cells = [
        [:dead, :dead,        :dead],
        [:dead, :target_cell, :dead],
        [:dead, :dead,        :dead]
      ]

      cell_row = 1
      cell_column = 1

      expect(
        subject.number_of_living_neighbours(cell_row, cell_column, dead_cells)
      ).to eq(0)
    end

    it " returns my neighbours" do 

      grid = [
        [:dead, :dead, :dead, :live],
        [:live, :dead, :live, :dead],
        [:dead, :dead, :dead, :dead]
      ]
      cell_row = 1
      cell_column = 1
      expect(subject.get_my_neighbours(cell_row, cell_column, grid)).to eq(
        [:dead, :dead, :dead, :live, :live, :dead, :dead,  :dead]
        )
    end

    it "returns number of live cells" do 

      neighbours = [:dead, :dead, :dead, :live, :live, :dead, :dead,  :dead]

      expect(
        subject.number_of_live_cells(neighbours)
      ).to eq(
        2
      )
    end
  end

end