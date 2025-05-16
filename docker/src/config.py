from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    db_user: str = Field(..., env="DB_USER")
    db_password: str = Field(..., env="DB_PASSWORD")
    db_host: str = Field(..., env="DB_HOST")
    db_port: str = Field(..., env="DB_PORT")
    db_name: str = Field(..., env="DB_NAME")

    class Config:
        env_file = ".env"
        case_sensitive = False

settings = Settings()
