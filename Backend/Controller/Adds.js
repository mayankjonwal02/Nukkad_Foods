const express = require('express');
const router = express.Router();

const { addAdds, getAdds, updateAdds, deleteAdds } = require('../Service/addsService');

router.post('/addAdds', addAdds);
router.get('/getAdds/:restaurantId', getAdds);
router.put('/updateAdds', updateAdds);
router.delete('/deleteAdds/:restaurantId', deleteAdds);


module.exports = router;