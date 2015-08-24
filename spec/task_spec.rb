require('spec_helper')

describe(Task) do

  it('tells which list it belongs to') do
    list = List.create({ :name => 'list' })
    task = Task.create({ :description => 'task', :list_id => list.id })
    expect(task.list()).to(eq(list))
  end

  it('validates that the user entered a description') do
    task = Task.new({:description => "" })
    expect(task.save()).to(eq(false))
  end

  describe(".not_done") do
      it("returns the not done tasks") do
        not_done_task1 = Task.create({ :description => "gotta do it", :done => false })
        not_done_task2 = Task.create({ :description => "gotta do it too", :done => false })
        not_done_tasks = [not_done_task1, not_done_task2]
        done_task = Task.create({ :description => "done task", :done => true })
        expect(Task.not_done()).to(eq(not_done_tasks))
      end
    end
end
