package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-y1B§;
   import §_-X1k§.§_-C2b§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-y1J§ extends §_-K1K§
   {
      
      private var §_-T24§:Vector.<§_-l1A§> = new Vector.<§_-l1A§>();
      
      private var §_-82G§:§_-y1B§ = null;
      
      public function §_-y1J§()
      {
         super(§_-K1K§.§_-b1B§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         this.§_-g2L§();
         §_-C2b§.init();
         if(param1 == null || param1.length == 0)
         {
            this.§_-73L§();
         }
         else if(param1[0] is Array)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.length)
            {
               _loc3_ = param1[_loc2_] as Array;
               if(!(_loc3_ == null || _loc3_.length < 7))
               {
                  this.§_-73L§().load(_loc3_);
               }
               _loc2_++;
            }
         }
         else
         {
            _loc4_ = 0;
            while(_loc4_ + 7 < param1.length)
            {
               _loc5_ = [param1[_loc4_],param1[_loc4_ + 1],param1[_loc4_ + 2],param1[_loc4_ + 3],param1[_loc4_ + 4],param1[_loc4_ + 5],param1[_loc4_ + 6],param1[_loc4_ + 7]];
               this.§_-73L§().load(_loc5_);
               _loc4_ += 8;
            }
         }
         this.§_-T4§();
      }
      
      override public function save() : §_-z1i§
      {
         var _loc2_:§_-l1A§ = null;
         var _loc3_:§_-z1i§ = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-T24§)
         {
            _loc5_ = _loc2_.§_-26§();
            if(_loc5_ != null)
            {
               _loc1_.push(_loc5_);
            }
         }
         _loc3_ = new §_-z1i§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         _loc3_.§_-C1W§(_loc1_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc6_ = _loc1_[_loc4_];
            _loc3_.writeByte(_loc6_[0]);
            _loc3_.§_-C1W§(_loc6_[1]);
            _loc3_.writeByte(_loc6_[2]);
            _loc3_.§_-C1W§(_loc6_[3]);
            _loc3_.writeByte(_loc6_[4]);
            _loc3_.§_-C1W§(_loc6_[5]);
            _loc3_.§_-C1W§(_loc6_[6]);
            _loc7_ = _loc6_[7] as Array;
            _loc8_ = _loc7_ != null ? int(_loc7_.length) : 0;
            _loc3_.§_-C1W§(_loc8_);
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc10_ = _loc7_[_loc9_] as Array;
               _loc3_.writeByte(_loc10_[0]);
               _loc3_.§_-C1W§(_loc10_[1]);
               _loc3_.writeByte(_loc10_[2]);
               _loc9_++;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      override protected function init() : void
      {
         addChild(this.§_-2H§);
         this.§_-l17§();
      }
      
      override protected function §_-c1v§() : void
      {
      }
      
      override protected function clear() : void
      {
         this.§_-g2L§();
      }
      
      override protected function get fieldList() : Array
      {
         return [];
      }
      
      private function §_-g2L§() : void
      {
         var _loc1_:§_-l1A§ = null;
         for each(_loc1_ in this.§_-T24§)
         {
            _loc1_.dispose();
         }
         this.§_-T24§ = new Vector.<§_-l1A§>();
         if(Boolean(this.§_-82G§) && Boolean(this.§_-82G§.parent))
         {
            this.§_-82G§.parent.removeChild(this.§_-82G§);
         }
         if(this.§_-2H§.parent)
         {
            this.§_-2H§.parent.removeChild(this.§_-2H§);
         }
         this.§_-2H§ = new Sprite();
         addChild(this.§_-2H§);
         this.§_-t1o§ = 0;
         this.§_-J1E§ = 0;
         this.§_-51U§ = false;
         this.§_-l17§();
      }
      
      private function §_-73L§() : §_-l1A§
      {
         var _loc1_:§_-l1A§ = new §_-l1A§(this.§_-02J§,this.§_-T4§);
         this.§_-T24§.push(_loc1_);
         this.§_-2H§.addChild(_loc1_.sprite);
         this.§_-T4§();
         return _loc1_;
      }
      
      private function §_-T4§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-T24§.length)
         {
            this.§_-T24§[_loc2_].sprite.x = 0;
            this.§_-T24§[_loc2_].sprite.y = _loc1_;
            _loc1_ += this.§_-T24§[_loc2_].§_-fc§() + 10;
            _loc2_++;
         }
         if(this.§_-82G§)
         {
            this.§_-82G§.x = 0;
            this.§_-82G§.y = _loc1_;
            if(this.§_-82G§.parent != this.§_-2H§)
            {
               this.§_-2H§.addChild(this.§_-82G§);
            }
         }
      }
      
      private function §_-l17§() : void
      {
         if(this.§_-82G§ != null)
         {
            return;
         }
         this.§_-82G§ = new §_-y1B§("<body><a href=\'event:#\'>Добавить пропуск</a></body>",0,0,§_-A3G§.style);
         this.§_-82G§.addEventListener(MouseEvent.CLICK,this.§_-13y§);
      }
      
      private function §_-13y§(param1:MouseEvent) : void
      {
         this.§_-73L§();
         this.§_-02J§();
      }
      
      private function §_-02J§() : void
      {
         this.§_-T4§();
         this.§_-51U§ = true;
         dispatchEvent(new Event("change"));
      }
   }
}

