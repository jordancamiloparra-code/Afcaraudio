/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        af: {
          black: '#09090B',
          surface: '#121215',
          card: '#18181C',
          crimson: '#E11D48',
          racing: '#DC2626',
          darkred: '#991B1B',
          chrome: '#D4D4D8',
          metallic: '#A1A1AA',
        }
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'sans-serif'],
        display: ['Outfit', 'Inter', 'system-ui', 'sans-serif'],
      },
      boxShadow: {
        'racing': '0 0 28px -4px rgba(225, 29, 72, 0.5)',
        'whatsapp': '0 0 25px -4px rgba(34, 197, 94, 0.45)',
      }
    },
  },
  plugins: [],
}
