package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-y1B§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-62x§ extends §_-K1K§
   {
      
      private var §_-xp§:Vector.<§_-53n§> = new Vector.<§_-53n§>();
      
      private var §_-F2r§:§_-y1B§ = null;
      
      public function §_-62x§()
      {
         super(§_-K1K§.§_-eS§);
      }
      
      private static function §_-j1S§(param1:*) : §_-z1i§
      {
         if(param1 == null)
         {
            return new §_-z1i§();
         }
         if(param1 is §_-z1i§)
         {
            return param1 as §_-z1i§;
         }
         var _loc2_:§_-z1i§ = new §_-z1i§();
         _loc2_.writeBytes(param1);
         _loc2_.position = 0;
         return _loc2_;
      }
      
      override public function load(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§_-53n§ = null;
         this.§_-g2L§();
         if(param1 != null)
         {
            _loc2_ = 0;
            while(_loc2_ + 1 < param1.length)
            {
               _loc3_ = this.§_-aV§();
               _loc3_.load(int(param1[_loc2_]),§_-j1S§(param1[_loc2_ + 1]));
               _loc2_ += 2;
            }
         }
         if(this.§_-xp§.length == 0)
         {
            this.§_-aV§();
         }
         this.§_-T4§();
      }
      
      override public function save() : §_-z1i§
      {
         var _loc2_:§_-53n§ = null;
         var _loc3_:§_-z1i§ = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:§_-z1i§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-xp§)
         {
            _loc5_ = _loc2_.§_-C3e§();
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
            _loc6_ = _loc1_[_loc4_][1] as §_-z1i§;
            _loc3_.writeByte(_loc1_[_loc4_][0]);
            _loc3_.§_-C1W§(_loc6_.length);
            _loc3_.writeBytes(_loc6_);
            _loc4_++;
         }
         return _loc3_;
      }
      
      override protected function init() : void
      {
         addChild(this.§_-2H§);
         this.§_-Kq§();
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
         var _loc1_:§_-53n§ = null;
         for each(_loc1_ in this.§_-xp§)
         {
            _loc1_.dispose();
         }
         this.§_-xp§ = new Vector.<§_-53n§>();
         if(Boolean(this.§_-F2r§) && Boolean(this.§_-F2r§.parent))
         {
            this.§_-F2r§.parent.removeChild(this.§_-F2r§);
         }
         if(this.§_-2H§.parent)
         {
            this.§_-2H§.parent.removeChild(this.§_-2H§);
         }
         this.§_-2H§ = new Sprite();
         addChild(this.§_-2H§);
         this.§_-51U§ = false;
         this.§_-Kq§();
      }
      
      private function §_-aV§() : §_-53n§
      {
         var _loc1_:§_-53n§ = new §_-53n§(this.§_-02J§,this.§_-T4§);
         this.§_-xp§.push(_loc1_);
         this.§_-2H§.addChild(_loc1_.sprite);
         this.§_-T4§();
         return _loc1_;
      }
      
      private function §_-T4§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-xp§.length)
         {
            this.§_-xp§[_loc2_].sprite.x = 0;
            this.§_-xp§[_loc2_].sprite.y = _loc1_;
            _loc1_ += this.§_-xp§[_loc2_].§_-fc§() + 12;
            _loc2_++;
         }
         if(this.§_-F2r§)
         {
            this.§_-F2r§.x = 0;
            this.§_-F2r§.y = _loc1_;
            if(this.§_-F2r§.parent != this.§_-2H§)
            {
               this.§_-2H§.addChild(this.§_-F2r§);
            }
         }
      }
      
      private function §_-Kq§() : void
      {
         if(this.§_-F2r§ != null)
         {
            return;
         }
         this.§_-F2r§ = new §_-y1B§("<body><a href=\'event:#\'>Добавить категорию</a></body>",0,0,§_-A3G§.style);
         this.§_-F2r§.addEventListener(MouseEvent.CLICK,this.§_-N20§);
      }
      
      private function §_-N20§(param1:MouseEvent) : void
      {
         var _loc2_:§_-53n§ = this.§_-aV§();
         _loc2_.load(0,new §_-z1i§());
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

