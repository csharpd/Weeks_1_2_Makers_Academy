require 'directory7'



describe 'student directory' do
  context 'at the start' do
     it 'welcomes you' do
      expect(self).to receive(:puts).with("Welcome to MA")
      welcome
     end

    it 'has no students in the array' do
      expect(students).to be_empty
    end

  context 'getting the input' do
    it 'asks for name' do
      expect(self).to receive(:puts).with("What's the students name?")
      ask_for("name")
    end

    it 'asks for cohort' do
      expect(self).to receive(:puts).with("What's the students cohort?")
      ask_for("cohort")
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
end
end

