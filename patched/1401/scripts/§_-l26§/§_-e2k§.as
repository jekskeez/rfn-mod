package §_-l26§
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-93C§;
   
   public class §_-e2k§ extends Sprite
   {
      
      protected var §_-B1A§:§_-s18§ = null;
      
      protected var image:Bitmap = null;
      
      protected var §_-c2h§:String = null;
      
      protected var §_-F1H§:Sprite = null;
      
      protected var fieldList:Vector.<§_-i1J§> = new Vector.<§_-i1J§>(0);
      
      public function §_-e2k§()
      {
         super();
         this.§_-iJ§();
      }
      
      public function get entity() : §_-s18§
      {
         return this.§_-B1A§;
      }
      
      public function §_-V2M§(param1:§_-s18§) : void
      {
         this.§_-B1A§ = param1;
         this.§_-c2h§ = null;
         this.update();
      }
      
      public function update() : void
      {
      }
      
      protected function §_-iJ§() : void
      {
         this.§_-F1H§ = new Sprite();
         addChild(this.§_-F1H§);
         this.§_-F1H§.addChild(new §_-i1J§("Список полей:",10,0,§_-32A§.§_-53t§));
      }
      
      protected function §_-a1a§() : void
      {
         var _loc1_:§_-i1J§ = null;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc7_:§_-i1J§ = null;
         if(!this.§_-B1A§)
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
         this.fieldList = new Vector.<§_-i1J§>(0);
         _loc2_ = this.§_-B1A§.formNames;
         _loc3_ = this.§_-B1A§.§_-yN§();
         _loc4_ = this.§_-B1A§.isClan ? 5 : 10;
         var _loc5_:int = this.§_-B1A§.isClan ? 110 : 120;
         var _loc6_:int = 0;
         while(_loc6_ < _loc2_.length)
         {
            if(_loc3_.indexOf(_loc6_) == -1)
            {
               _loc7_ = new §_-i1J§("<body><a href=\'event:#\'>" + _loc2_[_loc6_] + "</a></body>",20 + int(this.fieldList.length / _loc4_) * _loc5_,15 + 15 * (this.fieldList.length % _loc4_),§_-32A§.style);
               _loc7_.addEventListener(MouseEvent.CLICK,this.§_-P1n§);
               _loc7_.name = _loc6_.toString();
               this.§_-F1H§.addChild(_loc7_);
               this.fieldList.push(_loc7_);
            }
            _loc6_++;
         }
      }
      
      protected function §_-P1n§(param1:MouseEvent = null) : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         var _loc2_:int = int(param1.currentTarget.name);
         §_-MZ§.§_-U1y§(this.§_-B1A§,_loc2_);
      }
      
      protected function §_-62D§() : void
      {
         if(!this.§_-B1A§)
         {
            return;
         }
         var _loc1_:String = this.§_-B1A§.photoURL;
         if(!_loc1_)
         {
            this.§_-c2h§ = null;
            this.§_-31s§(null);
            return;
         }
         if(_loc1_ == this.§_-c2h§ && this.image != null && this.image.parent == this)
         {
            return;
         }
         this.§_-c2h§ = _loc1_;
         this.§_-31s§(null);
         §_-93C§.load(_loc1_,null,this.§_-Xj§,_loc1_);
      }
      
      protected function §_-31s§(param1:Bitmap) : void
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
         var _loc3_:Bitmap = §_-93C§.scale(_loc2_,50,50);
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
      
      protected function §_-Xj§(param1:Bitmap, param2:String) : void
      {
         if(!this.§_-B1A§ || param2 != this.§_-B1A§.photoURL)
         {
            return;
         }
         this.§_-31s§(param1);
      }
   }
}

