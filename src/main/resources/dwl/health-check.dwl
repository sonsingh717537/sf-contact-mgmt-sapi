%dw 2.0
output application/json
---
{
  "api": {
    "name": "sf-contact-mgmt-sapi",
    "version": "1.0.0",
    "environment": p("env")
  },
  "status": "OK",
  "message": "Success",
  "timestamp": now()
}