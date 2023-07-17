class Calender < ApplicationRecord
  scope :enable, ->{ where("day >= ?", Date.today) }

  validates :day,
  	presence: true,
  	uniqueness: true
  
  validate :time_valid,              if: :time_changed?
  validate :interval_valid,          if: :interval_changed?

  def time_changed?
    self.begin_time_changed? || self.close_time_changed?
  end

  def interval_changed?
    self.interval_s_changed? || self.interval_e_changed?
  end

  def time_valid
    # close_time のチェック
    if self.close_time < self.begin_time
      errors.add(:close_time, "の時刻は、#{self.begin_time.strftime('%H:%M')}より前の時刻にして下さい。")
      return
    end
  end

  def interval_valid
    # interval_e のチェック
    if self.interval_e < self.interval_s
      errors.add(:interval_e, "の時刻は、#{self.interval_s.strftime('%H:%M')}より前の時刻にして下さい。")
      return
    end

    if self.interval_e > self.close_time
      errors.add(:interval_e, "の時刻は、#{self.close_time.strftime('%H:%M')}より前の時刻にして下さい。")
      return
    end

    if self.interval_s < self.begin_time
      errors.add(:interval_s, "の時刻は、#{self.begin_time.strftime('%H:%M')}より後の時刻にして下さい。")
      return
    end

  end
end
