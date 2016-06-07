# encoding: utf-8
# frozen_string_literal: true

require 'spec_helper'

describe RuboCop::Cop::Lint::ExceptionCall do
  subject(:cop) { described_class.new }

  context 'raise' do
    let(:source){'raise StandardError "foo"'}
    it '' do
      inspect_source(cop, source)
      expect(cop.messages)
        .to eq(['カンマ(,)を忘れていませんか?'])
      expect(cop.offenses.size).to eq(1)
      expect(cop.highlights).to eq([' '])
    end

    it 'auto-correct comma' do
      new_source = autocorrect_source(cop, source)
      expect(new_source)
        .to eq('raise StandardError, "foo"')
    end
  end

  context 'fail' do
    let(:source){'fail ArgumentError "bar"'}
    it '' do
      inspect_source(cop, source)
      expect(cop.messages)
        .to eq(['カンマ(,)を忘れていませんか?'])
      expect(cop.offenses.size).to eq(1)
      expect(cop.highlights).to eq([' '])
    end

    it 'auto-correct comma' do
      new_source = autocorrect_source(cop, source)
      expect(new_source)
        .to eq('fail ArgumentError, "bar"')
    end
  end

  context 'Kernel.raise' do
    let(:source){'Kernel.raise IOError "baz"'}
    it '' do
      inspect_source(cop, source)
      expect(cop.messages)
        .to eq(['カンマ(,)を忘れていませんか?'])
      expect(cop.offenses.size).to eq(1)
      expect(cop.highlights).to eq([' '])
    end

    it 'auto-correct comma' do
      new_source = autocorrect_source(cop, source)
      expect(new_source)
        .to eq('Kernel.raise IOError, "baz"')
    end
  end

  context 'success' do
    let(:source){'raise StandardError, "foobar"'}

    it  do
      inspect_source(cop, source)
      expect(cop.messages)
      expect(cop.offenses).to be_empty
    end
  end
end
