require 'directory'
require 'csv'

describe 'student directory' do
  context 'at the start' do
     it 'welcomes you' do
      expect(self).to receive(:puts).with("Welcome to MA")
      welcome
     end

    it 'has no students in the array' do
      expect(students).to be_empty
    end
  end

  context 'getting the input' do
    it 'asks for name' do
      expect(self).to receive(:puts).with("What's the students name?")
      ask_for_name
    end

    it 'asks for cohort' do
      expect(self).to receive(:puts).with("What's the students cohort?")
      ask_for_cohort
    end

    it 'takes input from the user removing the new line' do
      input = "Chloe\n"
      expect(self).to receive(:gets).and_return(input)
      expect(user_input).to eq "Chloe"
    end
  end

  context 'create a student from the user input' do
    it ' adds the name to a hash containing the :name symbol' do
      student = {name: 'Chloe'}
      expect(create_student_named('Chloe')).to eq student
    end
  end

  context ' processing the student' do
    it 'add a student to the students array' do
      student = [{name: "David", cohort: "June"}]
      add(student)
      expect(students).to eq [student]
    end
  end

  context 'outputting the student' do
    it 'give us a student line' do
      student = {name: "David", cohort: "June"}
      expect(student_to_string(student)).to eq "David, June cohort"
    end

    it 'gives us a whole bunch of student lines' do
      ["David", "chloe", "sam"].each do |name|
        add({name: name, cohort: "June"})
            end
      expect(students_array_to_string).to eq "1.David, June cohort\n2.chloe, June cohort\n3.sam, June cohort"
    end
  end

  context 'saving students to a file' do
    let(:student_data) { { name: "mihah", cohort: "Jan" } }
    it 'transforms the students into a csv' do
      expect(student_to_csv(student_data)).to eq ["mihah","Jan"]
    end

    it 'saves the data to a csv file' do
        csv = double
        expect(csv).to receive(:<<).with(student_to_csv(student_data))
        expect(CSV).to receive(:open).with('./students.csv','wb').and yield(csv)
    end
   end
end

