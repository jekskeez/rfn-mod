package §_-1T§
{
   import §_-RI§.§_-XK§;
   import avmplus.getQualifiedClassName;
   import flash.display.Bitmap;
   import flash.display.Shape;
   import starling.textures.SubTexture;
   import starling.textures.Texture;
   import starling.textures.§_-n2K§;
   
   public class §_-02y§ extends §_-mu§
   {
      
      private static var _instance:§_-02y§;
      
      private var §_-J1N§:Vector.<Texture> = new Vector.<Texture>();
      
      private var §_-p2i§:Vector.<§_-XK§> = new Vector.<§_-XK§>();
      
      public function §_-02y§()
      {
         super();
      }
      
      public static function getInstance() : §_-02y§
      {
         if(!_instance)
         {
            _instance = new §_-02y§();
         }
         return _instance;
      }
      
      public function §_-23N§(param1:Texture) : Boolean
      {
         return this.§_-J1N§.indexOf(param1) != -1;
      }
      
      public function §_-Sm§(param1:Texture) : void
      {
         while(this.§_-J1N§.indexOf(param1) != -1)
         {
            this.§_-J1N§.splice(this.§_-J1N§.indexOf(param1),1);
         }
      }
      
      private function §_-o13§(param1:Vector.<§_-XK§>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            if(param1[_loc2_] is §_-XK§ && param1.length > 0)
            {
               if(param1[_loc2_].item)
               {
                  if(param1[_loc2_].item is SubTexture)
                  {
                     if(Boolean(SubTexture(param1[_loc2_].item).parent) && Boolean(SubTexture(param1[_loc2_].item).parent.base))
                     {
                        SubTexture(param1[_loc2_].item).parent.base.dispose();
                     }
                     SubTexture(param1[_loc2_].item).dispose();
                  }
                  else if(param1[_loc2_].item is §_-n2K§)
                  {
                     §_-n2K§(param1[_loc2_].item).dispose();
                  }
                  else
                  {
                     param1[_loc2_].item.dispose();
                  }
                  param1[_loc2_] = null;
               }
            }
            _loc2_++;
         }
         param1 = new Vector.<§_-XK§>();
      }
      
      public function §_-f2v§() : void
      {
         var _loc1_:Texture = null;
         var _loc2_:int = 0;
         var _loc3_:int = int(this.§_-J1N§.length);
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this.§_-J1N§[_loc2_];
            if(_loc1_ is SubTexture)
            {
               if(Boolean(SubTexture(_loc1_).parent) && Boolean(SubTexture(_loc1_).parent.base))
               {
                  SubTexture(_loc1_).parent.base.dispose();
               }
               SubTexture(_loc1_).dispose();
            }
            else if(_loc1_ is §_-n2K§)
            {
               §_-n2K§(_loc1_).dispose();
            }
            else
            {
               _loc1_.dispose();
            }
            this.§_-J1N§[_loc2_] = null;
            _loc2_++;
         }
         this.§_-J1N§ = new Vector.<Texture>();
         objects = {};
      }
      
      public function §_-fX§() : void
      {
         this.§_-o13§(this.§_-p2i§);
      }
      
      public function §_-o2l§(param1:Texture) : void
      {
         var _loc3_:§_-XK§ = null;
         var _loc6_:int = 0;
         var _loc2_:§_-XK§ = new §_-XK§(null);
         var _loc4_:int = 0;
         var _loc5_:int = int(this.§_-p2i§.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = this.§_-p2i§[_loc4_];
            if(_loc3_ is §_-XK§ && Boolean(_loc3_))
            {
               if(_loc3_.item == param1)
               {
                  if(_loc3_.item is SubTexture)
                  {
                     if(Boolean(SubTexture(_loc3_.item).parent) && Boolean(SubTexture(_loc3_.item).parent.base))
                     {
                        SubTexture(_loc3_.item).parent.base.dispose();
                     }
                     SubTexture(_loc3_.item).dispose();
                  }
                  else if(_loc3_.item is §_-n2K§)
                  {
                     §_-n2K§(_loc3_.item).dispose();
                  }
                  else
                  {
                     _loc3_.item.dispose();
                  }
                  this.§_-p2i§[_loc4_] = _loc2_;
               }
            }
            _loc4_++;
         }
         while(true)
         {
            _loc6_ = this.§_-p2i§.indexOf(_loc2_);
            if(_loc6_ == -1)
            {
               break;
            }
            this.§_-p2i§.splice(_loc6_,1);
         }
      }
      
      public function §_-8M§(param1:§_-XK§) : §_-XK§
      {
         this.§_-p2i§.push(param1);
         return param1;
      }
      
      override public function add(param1:String, param2:*, param3:Boolean = true, param4:String = "") : §_-XK§
      {
         if(param2 is Texture)
         {
            if(param1 == getQualifiedClassName(Shape) || param1 == getQualifiedClassName(Bitmap))
            {
               return this.§_-8M§(new §_-XK§(param2,true,param4));
            }
            this.§_-J1N§.push(param2);
            return super.add(param1,param2,param3,param4);
         }
         return null;
      }
   }
}

