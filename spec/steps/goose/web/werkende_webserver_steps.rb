steps_for :web do
  step 'ik de index pagina bezoek' do
    get '/'
  end

  step 'krijg ik een goeie response' do
    expect(last_response).to be_ok
  end
end
