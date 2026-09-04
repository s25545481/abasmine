# Minecraft Server on Railway

مدیریت سرور Minecraft با MCSManager روی Railway

## نصب

1. این repo رو fork کن
2. روی Railway بساز: [railway.app](https://railway.app)
3. New Project → Deploy from GitHub → این repo رو انتخاب کن
4. بعد از deploy، URL رو باز کن → پنل MCSManager میاد

## اتصال بازیکنان

چون Railway پورت 25565 رو expose نمیکنه، از **playit.gg** استفاده میشه:

1. وارد پنل MCSManager بشو
2. داخل terminal کانتینر بزن: `playit`
3. لینک claim رو باز کن و account بساز
4. آدرس tunnel رو به بازیکنان بده

## پورت‌ها

| سرویس | پورت |
|-------|------|
| MCSManager Panel | Railway URL (8080) |
| Minecraft | از طریق playit.gg |
