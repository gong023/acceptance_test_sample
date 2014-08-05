module GoogleSearch
  step '実行環境は :device' do |device|
    @device = device
  end

  step ':target_site へアクセス' do |target_site|
    driver.navigate.to target_site
  end

  step '検索フォームに :word と入力する' do |word|
    driver.find_element(:id, 'lst-ib').send_keys(word)
  end

  step 'フォームをsubmitする' do
    driver.find_element(:id, 'tsf').submit
  end

  step '検索結果に遷移したことを確認する' do
    wait = Selenium::WebDriver::Wait.new(timeout: 3)
    expect { wait.until { driver.find_element(:id, 'hdtb_msb') } }.not_to raise_error
  end

  step '検索結果をスクリーンショットに保存する' do
    driver.save_screenshot "./pic/#{@device}.png"
    cleanup
  end

  def driver
    case @device
    when 'firefox'
      @driver ||= Selenium::WebDriver.for :firefox
    when 'iPhone Simulator'
      @driver ||= Selenium::WebDriver.for(
        :remote,
        desired_capabilities:
            {
                browserName:     'safari',
                platformName:    'iOS',
                Platformversion: '7.1',
                deviceName:      'iPhone Simulator',
            },
        url: "http://127.0.0.1:4723/wd/hub"
      )
    when 'android'
      @driver ||= Selenium::WebDriver.for :android
    end
  end

  def cleanup
    driver.quit
    @driver = nil
  end
end

RSpec.configure do |c|
  c.include GoogleSearch
  c.after(:each) do
    cleanup if example.exception
  end
end
