def formatted_date_time_value(date_time):
    try:
        return date_time.strftime("%d %b %Y %H:%M:%S")
    except AttributeError:
        pass
