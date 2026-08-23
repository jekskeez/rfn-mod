package §_-p1f§
{
   import §_-I10§.§_-a1D§;
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-i1J§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-Q1K§ extends §_-6Y§
   {
      
      private var §_-a27§:Vector.<§_-AJ§> = new Vector.<§_-AJ§>();
      
      private var §_-s1X§:§_-i1J§ = null;
      
      public function §_-Q1K§()
      {
         super(§_-6Y§.§_-Ee§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         this.§_-t2h§();
         §_-a1D§.init();
         if(param1 == null || param1.length == 0)
         {
            this.§_-h1z§();
         }
         else if(param1[0] is Array)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.length)
            {
               _loc3_ = param1[_loc2_] as Array;
               if(!(_loc3_ == null || _loc3_.length < 7))
               {
                  this.§_-h1z§().load(_loc3_);
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
               this.§_-h1z§().load(_loc5_);
               _loc4_ += 8;
            }
         }
         this.§_-Q1t§();
      }
      
      override public function save() : §_-U1M§
      {
         var _loc2_:§_-AJ§ = null;
         var _loc3_:§_-U1M§ = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Array = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-a27§)
         {
            _loc5_ = _loc2_.§_-b1t§();
            if(_loc5_ != null)
            {
               _loc1_.push(_loc5_);
            }
         }
         _loc3_ = new §_-U1M§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         _loc3_.§_-s15§(_loc1_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc6_ = _loc1_[_loc4_];
            _loc3_.writeByte(_loc6_[0]);
            _loc3_.§_-s15§(_loc6_[1]);
            _loc3_.writeByte(_loc6_[2]);
            _loc3_.§_-s15§(_loc6_[3]);
            _loc3_.writeByte(_loc6_[4]);
            _loc3_.§_-s15§(_loc6_[5]);
            _loc3_.§_-s15§(_loc6_[6]);
            _loc7_ = _loc6_[7] as Array;
            _loc8_ = _loc7_ != null ? int(_loc7_.length) : 0;
            _loc3_.§_-s15§(_loc8_);
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               _loc10_ = _loc7_[_loc9_] as Array;
               _loc3_.writeByte(_loc10_[0]);
               _loc3_.§_-s15§(_loc10_[1]);
               _loc3_.writeByte(_loc10_[2]);
               _loc9_++;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      override protected function init() : void
      {
         addChild(this.§_-HL§);
         this.§_-d2Z§();
      }
      
      override protected function §_-X26§() : void
      {
      }
      
      override protected function clear() : void
      {
         this.§_-t2h§();
      }
      
      override protected function get fieldList() : Array
      {
         return [];
      }
      
      private function §_-t2h§() : void
      {
         var _loc1_:§_-AJ§ = null;
         for each(_loc1_ in this.§_-a27§)
         {
            _loc1_.dispose();
         }
         this.§_-a27§ = new Vector.<§_-AJ§>();
         if(Boolean(this.§_-s1X§) && Boolean(this.§_-s1X§.parent))
         {
            this.§_-s1X§.parent.removeChild(this.§_-s1X§);
         }
         if(this.§_-HL§.parent)
         {
            this.§_-HL§.parent.removeChild(this.§_-HL§);
         }
         this.§_-HL§ = new Sprite();
         addChild(this.§_-HL§);
         this.§_-22N§ = 0;
         this.§_-uH§ = 0;
         this.§_-72j§ = false;
         this.§_-d2Z§();
      }
      
      private function §_-h1z§() : §_-AJ§
      {
         var _loc1_:§_-AJ§ = new §_-AJ§(this.§_-qi§,this.§_-Q1t§);
         this.§_-a27§.push(_loc1_);
         this.§_-HL§.addChild(_loc1_.sprite);
         this.§_-Q1t§();
         return _loc1_;
      }
      
      private function §_-Q1t§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-a27§.length)
         {
            this.§_-a27§[_loc2_].sprite.x = 0;
            this.§_-a27§[_loc2_].sprite.y = _loc1_;
            _loc1_ += this.§_-a27§[_loc2_].§_-u22§() + 10;
            _loc2_++;
         }
         if(this.§_-s1X§)
         {
            this.§_-s1X§.x = 0;
            this.§_-s1X§.y = _loc1_;
            if(this.§_-s1X§.parent != this.§_-HL§)
            {
               this.§_-HL§.addChild(this.§_-s1X§);
            }
         }
      }
      
      private function §_-d2Z§() : void
      {
         if(this.§_-s1X§ != null)
         {
            return;
         }
         this.§_-s1X§ = new §_-i1J§("<body><a href=\'event:#\'>Добавить пропуск</a></body>",0,0,§_-32A§.style);
         this.§_-s1X§.addEventListener(MouseEvent.CLICK,this.§_-01n§);
      }
      
      private function §_-01n§(param1:MouseEvent) : void
      {
         this.§_-h1z§();
         this.§_-qi§();
      }
      
      private function §_-qi§() : void
      {
         this.§_-Q1t§();
         this.§_-72j§ = true;
         dispatchEvent(new Event("change"));
      }
   }
}

