package views
{
   import §_-53U§.§_-r1H§;
   import §_-68§.§_-M10§;
   import §_-I10§.§_-g2W§;
   import §_-N14§.§_-w2t§;
   import dragonBones.§_-E1r§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §_-DR§ extends Sprite
   {
      
      public var shaman:Boolean = false;
      
      private var armatures:Vector.<§_-E1r§> = new Vector.<§_-E1r§>();
      
      private var §_-53l§:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      private var clothes:Vector.<§_-r1H§> = new Vector.<§_-r1H§>();
      
      private var §_-l2w§:int = 0;
      
      private var §_-9l§:Boolean = true;
      
      public function §_-DR§()
      {
         super();
         this.init();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         this.§_-vz§ = super.visible = param1;
      }
      
      public function §_-7H§(param1:Array, param2:Array = null) : void
      {
         this.clothes[§_-g2W§.§_-O2w§].§_-K26§(param1.filter(this.§_-M2H§),param2);
         this.clothes[§_-g2W§.§_-x2F§].§_-K26§(param1.filter(this.§_-o2M§));
         this.clothes[§_-g2W§.§_-k22§].§_-K26§(param1.filter(this.§_-L3§));
         this.clothes[§_-g2W§.§_-YG§].§_-K26§(param1.filter(this.§_-gu§));
         this.§_-k1T§(this.view);
         this.§_-e1v§();
      }
      
      private function §_-k1T§(param1:int) : void
      {
         this.armatures[param1].animation.gotoAndPlay(Hero.§_-01j§);
      }
      
      public function get view() : int
      {
         return this.§_-l2w§;
      }
      
      public function set view(param1:int) : void
      {
         if(this.§_-l2w§ == param1)
         {
            return;
         }
         this.§_-53l§[this.view].visible = false;
         this.armatures[this.view].animation.stop();
         this.§_-l2w§ = param1;
         this.§_-53l§[this.view].visible = true;
         this.§_-k1T§(this.view);
         this.§_-e1v§();
      }
      
      public function get §_-vz§() : Boolean
      {
         return this.§_-9l§;
      }
      
      public function set §_-vz§(param1:Boolean) : void
      {
         var _loc2_:§_-E1r§ = null;
         if(param1 == this.§_-9l§)
         {
            return;
         }
         this.§_-9l§ = param1;
         for each(_loc2_ in this.armatures)
         {
            if(param1)
            {
               §_-w2t§.§_-R2J§.add(_loc2_);
            }
            else
            {
               §_-w2t§.§_-R2J§.remove(_loc2_);
            }
         }
      }
      
      private function §_-M2H§(param1:*, param2:int, param3:Array) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         return !§_-g2W§.§_-91b§(param1) && !§_-g2W§.§_-W2e§(param1) && !§_-g2W§.§_-D2d§(param1);
      }
      
      private function §_-o2M§(param1:*, param2:int, param3:Array) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         return §_-g2W§.§_-91b§(param1);
      }
      
      private function §_-L3§(param1:*, param2:int, param3:Array) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         return §_-g2W§.§_-W2e§(param1);
      }
      
      private function §_-gu§(param1:*, param2:int, param3:Array) : Boolean
      {
         if(Boolean(param2) || Boolean(param3))
         {
         }
         return §_-g2W§.§_-D2d§(param1);
      }
      
      private function init() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-g2W§.§_-W25§)
         {
            this.armatures[_loc1_] = §_-M10§.§_-238§(false).§_-g1F§(this.§_-E2K§(_loc1_));
            §_-w2t§.§_-R2J§.add(this.armatures[_loc1_]);
            if(_loc1_ == §_-g2W§.§_-O2w§)
            {
               this.armatures[_loc1_].animation.gotoAndPlay(Hero.§_-01j§);
            }
            this.clothes[_loc1_] = new §_-r1H§(this.armatures[_loc1_],false);
            this.§_-53l§[_loc1_] = this.armatures[_loc1_].display as DisplayObject;
            this.§_-53l§[_loc1_].scaleX = 2.8;
            this.§_-53l§[_loc1_].scaleY = 2.8;
            this.§_-53l§[_loc1_].visible = _loc1_ == §_-g2W§.§_-O2w§;
            addChild(this.§_-53l§[_loc1_]);
            _loc1_++;
         }
         this.mouseChildren = false;
         this.mouseEnabled = false;
         this.view = §_-g2W§.§_-O2w§;
      }
      
      private function §_-E2K§(param1:int) : String
      {
         switch(param1)
         {
            case §_-g2W§.§_-x2F§:
               return §_-M10§.§_-q1G§;
            case §_-g2W§.§_-k22§:
               return §_-M10§.§_-qT§;
            default:
               return §_-M10§.§_-OS§;
         }
      }
      
      private function §_-e1v§() : void
      {
         if(!this.shaman)
         {
            return;
         }
         if(this.clothes[§_-g2W§.§_-YG§].§_-y2A§().length > 0)
         {
            return;
         }
         this.clothes[§_-g2W§.§_-YG§].§_-K26§([§_-g2W§.§_-03k§]);
      }
   }
}

