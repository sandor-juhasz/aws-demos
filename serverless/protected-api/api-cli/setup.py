import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="protected-api-cli", # Replace with your own username
    version="0.0.1",
    author="Sandor Juhasz",
    author_email="sandor.juhasz.1983@gmail.com",
    description="CLI to access the IAM protected test API",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/sandor_juhasz",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
    entry_points = {
        'console_scripts': ['call-protected-api=api_cli.app:call_protected_api' ]
    },
    install_requires=[
        "boto3",
        "requests-aws-sign"
        ],
)
