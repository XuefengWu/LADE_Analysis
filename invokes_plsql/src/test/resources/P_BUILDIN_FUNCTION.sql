
  procedure P_BUILDIN_FUNCTION as

  begin
    m_year := to_char(m_accident_time, 'yyyy');
    m_begin_Date := add_months(m_date, -12);
  end; -- end procedure block
