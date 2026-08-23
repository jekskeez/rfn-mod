package §_-8Q§
{
   import §_-TK§.§_-aS§;
   import flash.display.Shape;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-A§ extends §_-aS§
   {
      
      private var §_-iU§:§_-aS§ = new §_-aS§();
      
      private var §_-As§:§_-aS§ = new §_-aS§();
      
      protected var §_-91F§:§_-aS§;
      
      protected var §_-YC§:Vector.<§_-xn§> = new Vector.<§_-xn§>();
      
      public var §_-v1G§:Vector.<§_-xn§> = new Vector.<§_-xn§>();
      
      protected var §_-m2u§:Boolean = false;
      
      public function §_-A§()
      {
         super();
         this.§_-91F§ = new §_-aS§();
         §_-J2J§(this.§_-iU§);
         §_-J2J§(this.§_-91F§);
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(this.touchable && param1 < 1)
         {
            this.touchable = false;
         }
         super.alpha = param1;
      }
      
      public function §_-zq§(param1:Vector.<§_-xn§>) : void
      {
         var _loc2_:Vector.<§_-xn§> = null;
         var _loc3_:§_-xn§ = null;
         var _loc4_:int = 0;
         for each(_loc3_ in param1)
         {
            _loc2_ = _loc3_ is GameBody ? this.§_-YC§ : this.§_-v1G§;
            _loc4_ = _loc2_.indexOf(_loc3_);
            if(_loc4_ == -1 && Boolean(_loc3_))
            {
               _loc2_.push(_loc3_);
            }
            else
            {
               this.§_-FL§(_loc3_ as §_-A§);
            }
         }
         this.§_-p2M§();
      }
      
      public function §_-FL§(param1:§_-A§) : void
      {
         var _loc2_:Vector.<§_-xn§> = param1 is GameBody ? this.§_-YC§ : this.§_-v1G§;
         var _loc3_:int = _loc2_.indexOf(param1 as §_-xn§);
         if(_loc3_ == -1)
         {
            return;
         }
         _loc2_.splice(_loc3_,1);
         this.§_-p2M§();
      }
      
      public function §_-Z4§() : void
      {
         var _loc1_:§_-xn§ = null;
         for each(_loc1_ in this.§_-v1G§.concat(this.§_-YC§))
         {
            if(_loc1_ != null)
            {
               (_loc1_ as §_-A§).§_-FL§(this);
            }
         }
         this.§_-v1G§ = new Vector.<§_-xn§>();
         this.§_-YC§ = new Vector.<§_-xn§>();
      }
      
      public function §_-p2M§() : void
      {
         var _loc4_:§_-xn§ = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = this.x;
         var _loc2_:int = this.y;
         var _loc3_:Shape = new Shape();
         while(this.§_-iU§.numChildren > 0)
         {
            this.§_-iU§.§_-av§(0);
         }
         _loc3_.graphics.lineStyle(2,16777215);
         this.§_-iU§.rotation = -this.rotation;
         for each(_loc4_ in this.§_-v1G§.concat(this.§_-YC§))
         {
            if(_loc4_ != null)
            {
               _loc5_ = (_loc4_ as §_-aS§).x - _loc1_;
               _loc6_ = (_loc4_ as §_-aS§).y - _loc2_;
               _loc3_.graphics.moveTo(0,0);
               _loc3_.graphics.lineTo(_loc5_,_loc6_);
            }
         }
         if(!this.§_-m2u§)
         {
            return;
         }
         this.§_-As§.removeFromParent();
         this.§_-As§ = new §_-aS§(_loc3_);
         this.§_-iU§.§_-J2J§(this.§_-As§);
      }
      
      protected function §_-A2O§() : void
      {
         var _loc1_:§_-xn§ = null;
         if(!this.§_-m2u§)
         {
            return;
         }
         this.§_-p2M§();
         for each(_loc1_ in this.§_-v1G§.concat(this.§_-YC§))
         {
            if(_loc1_ != null)
            {
               (_loc1_ as §_-A§).§_-p2M§();
            }
         }
      }
   }
}

