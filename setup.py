from setuptools import setup, find_packages

setup(
    name="hy-algorithms",
    version="0.1.0",
    packages=find_packages(),
    install_requires=[
        "hy>=0.24.0",
    ],
    author="Your Name",
    author_email="your.email@example.com",
    description="Algorithms and data structures implemented in Hy",
    long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Programming Language :: Lisp",
    ],
    python_requires=">=3.8",
)
