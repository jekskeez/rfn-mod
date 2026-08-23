package views
{
   import §_-AY§.§_-o2n§;
   import §_-Vu§.§_-p4§;
   import §_-X1k§.§_-P2x§;
   import §_-s2e§.§_-O1h§;
   import dragonBones.§_-833§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §_-o1H§ extends Sprite
   {
      
      public var shaman:Boolean = false;
      
      private var armatures:Vector.<§_-833§> = new Vector.<§_-833§>();
      
      private var §_-wg§:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      private var clothes:Vector.<§_-o2n§> = new Vector.<§_-o2n§>();
      
      private var §_-D1S§:int = 0;
      
      private var §_-v2K§:Boolean = true;
      
      public function §_-o1H§()
      {
         super();
         this.init();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         this.§_-G1u§ = super.visible = param1;
      }
      
      public function §_-VM§(param1:Array, param2:Array = null) : void
      {
         this.clothes[§_-P2x§.§_-T1B§].§_-533§(param1.filter(this.§_-c2K§),param2);
         this.clothes[§_-P2x§.§_-C1d§].§_-533§(param1.filter(this.§_-H2c§));
         this.clothes[§_-P2x§.§_-9f§].§_-533§(param1.filter(this.§_-S1g§));
         this.clothes[§_-P2x§.§_-o2O§].§_-533§(param1.filter(this.§_-y2E§));
         this.§_-fe§(this.view);
         this.§_-l1j§();
      }
      
      private function §_-fe§(param1:int) : void
      {
         this.armatures[param1].animation.gotoAndPlay(Hero.§_-z1s§);
      }
      
      public function get view() : int
      {
         return this.§_-D1S§;
      }
      
      public function set view(param1:int) : void
      {
         if(this.§_-D1S§ == param1)
         {
            return;
         }
         this.§_-wg§[this.view].visible = false;
         this.armatures[this.view].animation.stop();
         this.§_-D1S§ = param1;
         this.§_-wg§[this.view].visible = true;
         this.§_-fe§(this.view);
         this.§_-l1j§();
      }
      
      public function get §_-G1u§() : Boolean
      {
         return this.§_-v2K§;
      }
      
      public function set §_-G1u§(param1:Boolean) : void
      {
         var _loc2_:§_-833§ = null;
         if(param1 == this.§_-v2K§)
         {
            return;
         }
         this.§_-v2K§ = param1;
         for each(_loc2_ in this.armatures)
         {
            if(param1)
            {
               §_-p4§.§_-m1U§.add(_loc2_);
            }
            else
            {
               §_-p4§.§_-m1U§.remove(_loc2_);
            }
         }
      }
      
      private function §_-c2K§(param1:*, param2:int, param3:Array) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         return !§_-P2x§.§_-r5§(param1) && !§_-P2x§.§_-e2S§(param1) && !§_-P2x§.§_-k1G§(param1);
      }
      
      private function §_-H2c§(param1:*, param2:int, param3:Array) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         return §_-P2x§.§_-r5§(param1);
      }
      
      private function §_-S1g§(param1:*, param2:int, param3:Array) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         return §_-P2x§.§_-e2S§(param1);
      }
      
      private function §_-y2E§(param1:*, param2:int, param3:Array) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         return §_-P2x§.§_-k1G§(param1);
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-P2x§.§_-d2g§)
         {
            this.armatures[_loc1_] = §_-O1h§.§_-y1y§(false).§_-i2H§(this.§_-410§(_loc1_));
            §_-p4§.§_-m1U§.add(this.armatures[_loc1_]);
            if(_loc1_ == §_-P2x§.§_-T1B§)
            {
               this.armatures[_loc1_].animation.gotoAndPlay(Hero.§_-z1s§);
            }
            this.clothes[_loc1_] = new §_-o2n§(this.armatures[_loc1_],false);
            this.§_-wg§[_loc1_] = this.armatures[_loc1_].display as DisplayObject;
            this.§_-wg§[_loc1_].scaleX = 2.8;
            this.§_-wg§[_loc1_].scaleY = 2.8;
            this.§_-wg§[_loc1_].visible = _loc1_ == §_-P2x§.§_-T1B§;
            addChild(this.§_-wg§[_loc1_]);
            _loc1_++;
         }
         this.mouseChildren = false;
         this.mouseEnabled = false;
         this.view = §_-P2x§.§_-T1B§;
      }
      
      private function §_-410§(param1:int) : String
      {
         switch(param1)
         {
            case §_-P2x§.§_-C1d§:
               return §_-O1h§.§_-rR§;
            case §_-P2x§.§_-9f§:
               return §_-O1h§.§_-b2N§;
            default:
               return §_-O1h§.§_-m11§;
         }
      }
      
      private function §_-l1j§() : void
      {
         if(!this.shaman)
         {
            return;
         }
         if(this.clothes[§_-P2x§.§_-o2O§].§_-Th§().length > 0)
         {
            return;
         }
         this.clothes[§_-P2x§.§_-o2O§].§_-533§([§_-P2x§.§_-c1n§]);
      }
   }
}

