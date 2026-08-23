package §_-E1v§
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-O1T§;
   
   public class §_-o2J§ extends Sprite
   {
      
      protected var §_-82y§:§_-J2w§ = null;
      
      protected var image:Bitmap = null;
      
      protected var §_-s2r§:String = null;
      
      protected var §_-41V§:Sprite = null;
      
      protected var fieldList:Vector.<§_-y1B§> = new Vector.<§_-y1B§>(0);
      
      public function §_-o2J§()
      {
         super();
         this.§_-S1T§();
      }
      
      public function get entity() : §_-J2w§
      {
         return this.§_-82y§;
      }
      
      public function §_-v15§(param1:§_-J2w§) : void
      {
         this.§_-82y§ = param1;
         this.§_-s2r§ = null;
         this.update();
      }
      
      public function update() : void
      {
      }
      
      protected function §_-S1T§() : void
      {
         this.§_-41V§ = new Sprite();
         addChild(this.§_-41V§);
         this.§_-41V§.addChild(new §_-y1B§("Список полей:",10,0,§_-A3G§.§_-v1I§));
      }
      
      protected function §_-c1o§() : void
      {
         var _loc1_:§_-y1B§ = null;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc7_:§_-y1B§ = null;
         if(!this.§_-82y§)
         {
            return;
         }
         for each(_loc1_ in this.fieldList)
         {
            if(_loc1_.parent)
            {
               _loc1_.parent.removeChild(_loc1_);
            }
         }
         this.fieldList = new Vector.<§_-y1B§>(0);
         _loc2_ = this.§_-82y§.formNames;
         _loc3_ = this.§_-82y§.§_-D1H§();
         _loc4_ = this.§_-82y§.isClan ? 5 : 10;
         var _loc5_:int = this.§_-82y§.isClan ? 110 : 120;
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_.length)
         {
            if(_loc3_.indexOf(_loc6_) == -1)
            {
               _loc7_ = new §_-y1B§("<body><a href=\'event:#\'>" + _loc2_[_loc6_] + "</a></body>",20 + int(this.fieldList.length / _loc4_) * _loc5_,15 + 15 * (this.fieldList.length % _loc4_),§_-A3G§.style);
               _loc7_.addEventListener(MouseEvent.CLICK,this.§_-628§);
               _loc7_.name = _loc6_.toString();
               this.§_-41V§.addChild(_loc7_);
               this.fieldList.push(_loc7_);
            }
            _loc6_++;
         }
      }
      
      protected function §_-628§(param1:MouseEvent = null) : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         var _loc2_:int = int(param1.currentTarget.name);
         §_-31Y§.§_-QG§(this.§_-82y§,_loc2_);
      }
      
      protected function §_-A1M§() : void
      {
         if(!this.§_-82y§)
         {
            return;
         }
         var _loc1_:String = this.§_-82y§.photoURL;
         if(!_loc1_)
         {
            this.§_-s2r§ = null;
            this.§_-u18§(null);
            return;
         }
         if(_loc1_ == this.§_-s2r§ && this.image != null && this.image.parent == this)
         {
            return;
         }
         this.§_-s2r§ = _loc1_;
         this.§_-u18§(null);
         §_-O1T§.load(_loc1_,null,this.§_-w21§,_loc1_);
      }
      
      protected function §_-u18§(param1:Bitmap) : void
      {
         var _loc2_:Bitmap = null;
         if(this.image != null && this.image.parent == this)
         {
            removeChild(this.image);
         }
         if(param1 == null)
         {
            _loc2_ = new Bitmap(new BitmapData(50,50,false,11184810));
         }
         else
         {
            _loc2_ = param1;
         }
         var _loc3_:Bitmap = §_-O1T§.scale(_loc2_,50,50);
         this.image = new Bitmap(_loc3_.bitmapData);
         if(this.image.width > this.image.height)
         {
            this.image.width = 50;
            this.image.scaleY = this.image.scaleX;
         }
         else
         {
            this.image.height = 50;
            this.image.scaleX = this.image.scaleY;
         }
         addChild(this.image);
      }
      
      protected function §_-w21§(param1:Bitmap, param2:String) : void
      {
         if(!this.§_-82y§ || param2 != this.§_-82y§.photoURL)
         {
            return;
         }
         this.§_-u18§(param1);
      }
   }
}

