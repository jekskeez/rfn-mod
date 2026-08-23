package §_-p1f§
{
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-i1J§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-m7§ extends §_-6Y§
   {
      
      private var §_-q1o§:Vector.<§_-r2E§> = new Vector.<§_-r2E§>();
      
      private var §_-71d§:§_-i1J§ = null;
      
      public function §_-m7§()
      {
         super(§_-6Y§.§_-43h§);
      }
      
      private static function §_-01p§(param1:*) : §_-U1M§
      {
         if(param1 == null)
         {
            return new §_-U1M§();
         }
         if(param1 is §_-U1M§)
         {
            return param1 as §_-U1M§;
         }
         var _loc2_:§_-U1M§ = new §_-U1M§();
         _loc2_.writeBytes(param1);
         _loc2_.position = 0;
         return _loc2_;
      }
      
      override public function load(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§_-r2E§ = null;
         this.§_-t2h§();
         if(param1 != null)
         {
            _loc2_ = 0;
            while(_loc2_ + 1 < param1.length)
            {
               _loc3_ = this.§_-xH§();
               _loc3_.load(int(param1[_loc2_]),§_-01p§(param1[_loc2_ + 1]));
               _loc2_ += 2;
            }
         }
         if(this.§_-q1o§.length == 0)
         {
            this.§_-xH§();
         }
         this.§_-Q1t§();
      }
      
      override public function save() : §_-U1M§
      {
         var _loc2_:§_-r2E§ = null;
         var _loc3_:§_-U1M§ = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:§_-U1M§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-q1o§)
         {
            _loc5_ = _loc2_.§_-Q1d§();
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
            _loc6_ = _loc1_[_loc4_][1] as §_-U1M§;
            _loc3_.writeByte(_loc1_[_loc4_][0]);
            _loc3_.§_-s15§(_loc6_.length);
            _loc3_.writeBytes(_loc6_);
            _loc4_++;
         }
         return _loc3_;
      }
      
      override protected function init() : void
      {
         addChild(this.§_-HL§);
         this.§_-B1m§();
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
         var _loc1_:§_-r2E§ = null;
         for each(_loc1_ in this.§_-q1o§)
         {
            _loc1_.dispose();
         }
         this.§_-q1o§ = new Vector.<§_-r2E§>();
         if(Boolean(this.§_-71d§) && Boolean(this.§_-71d§.parent))
         {
            this.§_-71d§.parent.removeChild(this.§_-71d§);
         }
         if(this.§_-HL§.parent)
         {
            this.§_-HL§.parent.removeChild(this.§_-HL§);
         }
         this.§_-HL§ = new Sprite();
         addChild(this.§_-HL§);
         this.§_-72j§ = false;
         this.§_-B1m§();
      }
      
      private function §_-xH§() : §_-r2E§
      {
         var _loc1_:§_-r2E§ = new §_-r2E§(this.§_-qi§,this.§_-Q1t§);
         this.§_-q1o§.push(_loc1_);
         this.§_-HL§.addChild(_loc1_.sprite);
         this.§_-Q1t§();
         return _loc1_;
      }
      
      private function §_-Q1t§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-q1o§.length)
         {
            this.§_-q1o§[_loc2_].sprite.x = 0;
            this.§_-q1o§[_loc2_].sprite.y = _loc1_;
            _loc1_ += this.§_-q1o§[_loc2_].§_-u22§() + 12;
            _loc2_++;
         }
         if(this.§_-71d§)
         {
            this.§_-71d§.x = 0;
            this.§_-71d§.y = _loc1_;
            if(this.§_-71d§.parent != this.§_-HL§)
            {
               this.§_-HL§.addChild(this.§_-71d§);
            }
         }
      }
      
      private function §_-B1m§() : void
      {
         if(this.§_-71d§ != null)
         {
            return;
         }
         this.§_-71d§ = new §_-i1J§("<body><a href=\'event:#\'>Добавить категорию</a></body>",0,0,§_-32A§.style);
         this.§_-71d§.addEventListener(MouseEvent.CLICK,this.§_-G1d§);
      }
      
      private function §_-G1d§(param1:MouseEvent) : void
      {
         var _loc2_:§_-r2E§ = this.§_-xH§();
         _loc2_.load(0,new §_-U1M§());
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

